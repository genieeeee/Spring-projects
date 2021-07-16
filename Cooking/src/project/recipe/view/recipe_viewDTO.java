package project.recipe.view;

public class recipe_viewDTO {
	
	private int recipe_idx;
	private int user_idx;
    private String recipe_category;
    private String recipe_title;
    private String recipe_img;
    private String recipe_simple_comment;
    private String recipe_material;
    private String recipe_step;
    private int recipe_time_s;
    private int recipe_time_a;
    private int recipe_price;
    private String recipe_recommend;
    
    public recipe_viewDTO() {
	}

	public recipe_viewDTO(int recipe_idx, int user_idx, String recipe_category, String recipe_title, String recipe_img,
			String recipe_simple_comment, String recipe_material, String recipe_step, int recipe_time_s,
			int recipe_time_a, int recipe_price, String recipe_recommend) {
		super();
		this.recipe_idx = recipe_idx;
		this.user_idx = user_idx;
		this.recipe_category = recipe_category;
		this.recipe_title = recipe_title;
		this.recipe_img = recipe_img;
		this.recipe_simple_comment = recipe_simple_comment;
		this.recipe_material = recipe_material;
		this.recipe_step = recipe_step;
		this.recipe_time_s = recipe_time_s;
		this.recipe_time_a = recipe_time_a;
		this.recipe_price = recipe_price;
		this.recipe_recommend = recipe_recommend;
	}

	public int getRecipe_idx() {
		return recipe_idx;
	}

	public void setRecipe_idx(int recipe_idx) {
		this.recipe_idx = recipe_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getRecipe_category() {
		return recipe_category;
	}

	public void setRecipe_category(String recipe_category) {
		this.recipe_category = recipe_category;
	}

	public String getRecipe_title() {
		return recipe_title;
	}

	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}

	public String getRecipe_img() {
		return recipe_img;
	}

	public void setRecipe_img(String recipe_img) {
		this.recipe_img = recipe_img;
	}

	public String getRecipe_simple_comment() {
		return recipe_simple_comment;
	}

	public void setRecipe_simple_comment(String recipe_simple_comment) {
		this.recipe_simple_comment = recipe_simple_comment;
	}

	public String getRecipe_material() {
		return recipe_material;
	}

	public void setRecipe_material(String recipe_material) {
		this.recipe_material = recipe_material;
	}

	public String getRecipe_step() {
		return recipe_step;
	}

	public void setRecipe_step(String recipe_step) {
		this.recipe_step = recipe_step;
	}

	public int getRecipe_time_s() {
		return recipe_time_s;
	}

	public void setRecipe_time_s(int recipe_time_s) {
		this.recipe_time_s = recipe_time_s;
	}

	public int getRecipe_time_a() {
		return recipe_time_a;
	}

	public void setRecipe_time_a(int recipe_time_a) {
		this.recipe_time_a = recipe_time_a;
	}

	public int getRecipe_price() {
		return recipe_price;
	}

	public void setRecipe_price(int recipe_price) {
		this.recipe_price = recipe_price;
	}

	public String getRecipe_recommend() {
		return recipe_recommend;
	}

	public void setRecipe_recommend(String recipe_recommend) {
		this.recipe_recommend = recipe_recommend;
	}
    
}
