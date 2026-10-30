package app.mealpilot;

import java.time.LocalDate;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@RestController
@RequestMapping("/api")
public class ApiController {
  private final JdbcTemplate db; private final PasswordEncoder encoder;
  private final Map<String,Long> sessions = new ConcurrentHashMap<>();
  public ApiController(JdbcTemplate db, PasswordEncoder encoder) { this.db=db; this.encoder=encoder; }

  @GetMapping("/health") public Map<String,Object> health() { return Map.of("status","ok","service","mealpilot-api"); }
  @GetMapping("/recipes") public List<Map<String,Object>> recipes(@RequestParam(required=false) String category,
      @RequestParam(required=false) String q, @RequestParam(required=false) Double maxCost,
      @RequestParam(required=false) String diet) {
    StringBuilder sql=new StringBuilder("SELECT id,name,emoji,prep_minutes AS time,category,description,color,calories AS kcal,protein_g AS protein,carbs_g AS carbs,fat_g AS fat,estimated_cost AS cost FROM recipe WHERE active=true");
    List<Object> args=new ArrayList<>();
    if(category!=null&&!category.isBlank()){sql.append(" AND category=?");args.add(category);}
    if(q!=null&&!q.isBlank()){sql.append(" AND (LOWER(name) LIKE ? OR LOWER(description) LIKE ?)");args.add("%"+q.toLowerCase()+"%");args.add("%"+q.toLowerCase()+"%");}
    if(maxCost!=null){sql.append(" AND estimated_cost<=?");args.add(maxCost);}
    sql.append(" ORDER BY name");
    List<Map<String,Object>> result=db.queryForList(sql.toString(),args.toArray());
    for(Map<String,Object> r:result){r.put("ingredients",db.queryForList("SELECT i.name,i.category,ri.quantity,ri.unit,ri.estimated_cost AS \"estimatedCost\" FROM recipe_ingredient ri JOIN ingredient i ON i.id=ri.ingredient_id WHERE ri.recipe_id=? ORDER BY i.name",r.get("id")));}
    return result;
  }
  @PostMapping("/auth/register") public Map<String,Object> register(@RequestBody Map<String,String> body){
    String email=required(body,"email").trim().toLowerCase(Locale.ROOT), password=required(body,"password"), name=Optional.ofNullable(body.get("name")).filter(s->!s.isBlank()).orElse(email.split("@")[0]);
    if(!email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Adresse e-mail invalide");
    if(password.length()<8) throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Le mot de passe doit contenir au moins 8 caractères");
    if(!db.queryForList("SELECT id FROM app_user WHERE email=?",Long.class,email).isEmpty()) throw new ResponseStatusException(HttpStatus.CONFLICT,"Un compte existe déjà avec cet e-mail");
    db.update("INSERT INTO app_user(name,email,password_hash) VALUES (?,?,?)",name,email,encoder.encode(password));
    long id=db.queryForObject("SELECT id FROM app_user WHERE email=?",Long.class,email);
    db.update("INSERT INTO athlete_profile(user_id) VALUES (?)",id); return session(id,email,name);
  }
  @PostMapping("/auth/login") public Map<String,Object> login(@RequestBody Map<String,String> body){
    String email=required(body,"email").trim().toLowerCase(Locale.ROOT), password=required(body,"password");
    List<Map<String,Object>> rows=db.queryForList("SELECT id,name,password_hash FROM app_user WHERE email=?",email);
    if(rows.isEmpty()||!encoder.matches(password,(String)rows.get(0).get("password_hash"))) throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Identifiants incorrects");
    Map<String,Object> u=rows.get(0); return session(((Number)u.get("id")).longValue(),email,(String)u.get("name"));
  }
  @PostMapping("/auth/logout") public Map<String,String> logout(@RequestHeader(value="Authorization",required=false) String auth){if(auth!=null)sessions.remove(auth.replaceFirst("(?i)^Bearer ",""));return Map.of("status","ok");}
  @GetMapping("/me") public Map<String,Object> me(@RequestHeader("Authorization") String auth){long id=userId(auth);return db.queryForMap("SELECT id,name,email,created_at FROM app_user WHERE id=?",id);}
  @GetMapping("/profile") public Map<String,Object> profile(@RequestHeader("Authorization") String auth){return db.queryForMap("SELECT age,sex,height_cm AS height,weight_kg AS weight,activity,goal,diet,weekly_budget AS budget,portions,avoid_ingredients AS avoid FROM athlete_profile WHERE user_id=?",userId(auth));}
  @PutMapping("/profile") public Map<String,Object> saveProfile(@RequestHeader("Authorization") String auth,@RequestBody Map<String,Object> b){long id=userId(auth);db.update("UPDATE athlete_profile SET age=?,sex=?,height_cm=?,weight_kg=?,activity=?,goal=?,diet=?,weekly_budget=?,portions=?,avoid_ingredients=? WHERE user_id=?",num(b,"age"),str(b,"sex","homme"),num(b,"height"),num(b,"weight"),num(b,"activity",1.55),str(b,"goal","maintain"),str(b,"diet","omnivore"),num(b,"budget",65),num(b,"portions",1),str(b,"avoid",""),id);return profile(auth);}
  @GetMapping("/favorites") public List<Map<String,Object>> favorites(@RequestHeader("Authorization") String auth){return db.queryForList("SELECT r.id,r.name,r.category,r.estimated_cost AS cost FROM favorite f JOIN recipe r ON r.id=f.recipe_id WHERE f.user_id=? ORDER BY f.created_at DESC",userId(auth));}
  @PostMapping("/favorites/{recipeId}") public Map<String,Object> addFavorite(@RequestHeader("Authorization") String auth,@PathVariable String recipeId){long id=userId(auth);if(db.queryForList("SELECT id FROM recipe WHERE id=?",recipeId).isEmpty())throw new ResponseStatusException(HttpStatus.NOT_FOUND,"Recette inconnue");db.update("INSERT INTO favorite(user_id,recipe_id) VALUES (?,?) ON CONFLICT DO NOTHING",id,recipeId);return Map.of("status","ok");}
  @DeleteMapping("/favorites/{recipeId}") public Map<String,String> deleteFavorite(@RequestHeader("Authorization") String auth,@PathVariable String recipeId){db.update("DELETE FROM favorite WHERE user_id=? AND recipe_id=?",userId(auth),recipeId);return Map.of("status","ok");}
  @GetMapping("/plans") public List<Map<String,Object>> plans(@RequestHeader("Authorization") String auth){return db.queryForList("SELECT id,week_start,created_at FROM weekly_plan WHERE user_id=? ORDER BY week_start DESC",userId(auth));}
  @PutMapping("/plans/{weekStart}") public Map<String,Object> savePlan(@RequestHeader("Authorization") String auth,@PathVariable LocalDate weekStart,@RequestBody List<Map<String,Object>> meals){long uid=userId(auth);db.update("INSERT INTO weekly_plan(user_id,week_start) VALUES (?,?) ON CONFLICT(user_id,week_start) DO NOTHING",uid,weekStart);long pid=db.queryForObject("SELECT id FROM weekly_plan WHERE user_id=? AND week_start=?",Long.class,uid,weekStart);for(Map<String,Object> m:meals){int day=((Number)m.get("dayOfWeek")).intValue();String type=String.valueOf(m.get("mealType"));String rid=m.get("recipeId")==null?null:String.valueOf(m.get("recipeId"));double servings=m.get("servings") instanceof Number n?n.doubleValue():1;db.update("INSERT INTO planned_meal(plan_id,day_of_week,meal_type,recipe_id,servings) VALUES (?,?,?,?,?) ON CONFLICT(plan_id,day_of_week,meal_type) DO UPDATE SET recipe_id=EXCLUDED.recipe_id,servings=EXCLUDED.servings",pid,day,type,rid,servings);}return Map.of("id",pid,"weekStart",weekStart,"saved",meals.size());}
  @GetMapping("/plans/{weekStart}/meals") public List<Map<String,Object>> planMeals(@RequestHeader("Authorization") String auth,@PathVariable LocalDate weekStart){long uid=userId(auth);return db.queryForList("SELECT pm.day_of_week AS \"dayOfWeek\",pm.meal_type AS \"mealType\",pm.recipe_id AS \"recipeId\",pm.servings,r.name FROM planned_meal pm JOIN weekly_plan p ON p.id=pm.plan_id LEFT JOIN recipe r ON r.id=pm.recipe_id WHERE p.user_id=? AND p.week_start=? ORDER BY pm.day_of_week,pm.meal_type",uid,weekStart);}
  @PostMapping("/food-logs") public Map<String,Object> logFood(@RequestHeader("Authorization") String auth,@RequestBody Map<String,Object> b){long uid=userId(auth);db.update("INSERT INTO food_log(user_id,consumed_on,recipe_id,meal_type,servings,calories,protein_g,carbs_g,fat_g,note) VALUES (?,?,?,?,?,?,?,?,?,?)",uid,LocalDate.parse(str(b,"consumedOn",LocalDate.now().toString())),b.get("recipeId"),b.get("mealType"),num(b,"servings",1),num(b,"calories",0),num(b,"protein",0),num(b,"carbs",0),num(b,"fat",0),str(b,"note",""));return Map.of("status","ok");}
  @GetMapping("/food-logs") public List<Map<String,Object>> foodLogs(@RequestHeader("Authorization") String auth,@RequestParam(defaultValue="14") int days){return db.queryForList("SELECT * FROM food_log WHERE user_id=? AND consumed_on>=CURRENT_DATE-(? * INTERVAL '1 day') ORDER BY consumed_on DESC",userId(auth),Math.min(Math.max(days,1),365));}
  private Map<String,Object> session(long id,String email,String name){String token=UUID.randomUUID().toString();sessions.put(token,id);return Map.of("token",token,"user",Map.of("id",id,"email",email,"name",name));}
  private long userId(String auth){if(auth==null)throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);String token=auth.replaceFirst("(?i)^Bearer ","").trim();Long id=sessions.get(token);if(id==null)throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Session expirée ou invalide");return id;}
  private static String required(Map<String,String>b,String k){String v=b.get(k);if(v==null||v.isBlank())throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Champ requis : "+k);return v;}
  private static String str(Map<String,Object>b,String k,String d){Object v=b.get(k);return v==null?d:String.valueOf(v);}
  private static Object num(Map<String,Object>b,String k){return num(b,k,null);}
  private static Object num(Map<String,Object>b,String k,Object d){Object v=b.get(k);return v==null?d:v;}
}
@Configuration
class CorsConfig implements WebMvcConfigurer {
 @Override public void addCorsMappings(CorsRegistry registry){registry.addMapping("/api/**").allowedOrigins("http://localhost:5173","http://127.0.0.1:5173").allowedMethods("GET","POST","PUT","DELETE","OPTIONS").allowedHeaders("*");}
}
