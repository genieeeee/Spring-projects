package project.search;

public class SearchMainInterpace {
	public static final int DEFAULT = 0;
	
	public static final int TIME_10_LESS = 1;
	public static final int TIME_10_20 = 2;
	public static final int TIME_20_30 = 3;
	public static final int TIME_30_40 = 4;
	public static final int TIME_40_over = 5;
	
	public static final int PRICE_DESC = 1;
	public static final int PRICE_ASC = 2;
	
	public static final int CATEGORY_KOR=1;
	public static final int CATEGORY_CHA=2;
	public static final int CATEGORY_ENG=3;
	public static final int CATEGORY_JPN=4;
	public static final int CATEGORY_NIGHT=5;
	public static final int CATEGORY_ETC=6;
	
	public static final int SELECT_TITLE = 1;
	public static final int SELECT_CONTENT = 2;
	public static final int SELECT_TITLE_AND_CONTENT = 3;
	
	public static final String NO_SEARCH_STR = "!@#$%^&*()_+-=\\|'\"";
	
	public String createSQL(boolean searchOptionTime[], String searchOptionPrice,
			boolean searchOptionCategory[], String searchOptionStr, int searchOptionSelected){
		String result = "";
//		System.out.println("searchOptionTime[DEFAULT] : "+searchOptionTime[DEFAULT]);
//		System.out.println(" searchOptionPrice :" +  searchOptionPrice);
//		System.out.println("searchOptionCategory[DEFAULT] : "+searchOptionCategory[DEFAULT]);
	
		int time[]={0, 10, 20, 30, 40};
		
		
		if(!searchOptionTime[DEFAULT] || !searchOptionCategory[DEFAULT] || !(searchOptionStr==null || searchOptionStr.equals(""))){
			result += "where ";
		}else if(searchOptionPrice==""){
			return result;
		}
		
		if(!searchOptionTime[DEFAULT]){
//			System.out.println("searchOptionTime[TIME_10_LESS] : "+searchOptionTime[TIME_10_LESS]);
			
			int timeMax=0;
			int timeMin=0;
			
			for(int i=1; i<searchOptionTime.length; i++){
				if(searchOptionTime[i]){
					timeMax=i;
				}
			}
				
			for(int i=searchOptionTime.length-1; 1<=i; i--){
				if(searchOptionTime[i]){
					timeMin=i;
				}
			}
			
			result+="(";
			
			for(int i=timeMin, timeMinTemp=timeMin-1; i<=timeMax; i++){
//				System.out.println(i+"행 result : "+result);
				if(!searchOptionTime[i]){
					if(searchOptionTime[i-1]){
						result+="("+time[timeMinTemp]+"<=recipe_time_a and recipe_time_s<="+time[i-1]+") or ";
					}
					timeMinTemp=i;
				}else if(i==timeMax){
					if(timeMax==searchOptionTime.length-1){
						result+=time[timeMinTemp]+"<=recipe_time_s ";
					}else{
						result+="("+time[timeMinTemp]+"<=recipe_time_a and recipe_time_s<="+time[timeMax]+") ";
					}
				}
			}
			result += ") ";
			
//			if(!searchOptionTime[TIME_10_LESS]){
//				for(int i=1; i<searchOptionTime.length; i++){
//					//...................
//				}
//				result += "not recipe_time_a<=10 ";
//			}
////			System.out.println("searchOptionTime[TIME_10_20] : "+searchOptionTime[TIME_10_20]);
//			if(!searchOptionTime[TIME_10_20]){
//				if(!searchOptionTime[TIME_10_LESS]){
//					result = "and ";
//				}
//				result += "not (recipe_time_s>=10 and recipe_time_a<=20) ";
//			}
//			if(!searchOptionTime[TIME_20_30]){
//				if(!searchOptionTime[TIME_10_LESS] || !searchOptionTime[TIME_10_20]){
//					result += "and ";
//				}
//				result += "not (recipe_time_s>=20 and recipe_time_a<=30) ";
//			}
//			if(!searchOptionTime[TIME_30_40]){
//				if(!searchOptionTime[TIME_10_LESS] || !searchOptionTime[TIME_10_20] || !searchOptionTime[TIME_20_30]){
//					result += "and ";
//				}
//				result += "not (recipe_time_s>=30 and recipe_time_a<=40) ";
//			}
//			if(!searchOptionTime[TIME_40_over]){
//				if(!searchOptionTime[TIME_10_LESS] || !searchOptionTime[TIME_10_20] || !searchOptionTime[TIME_20_30] || !searchOptionTime[TIME_30_40]){
//					result += "and ";
//				}
//				result += "not (recipe_time_a>=40) ";
//			}
			
		}
		
		if(!searchOptionCategory[DEFAULT]){
			if(!searchOptionTime[DEFAULT]){
				result += "and ";
			}
			result+="(";
			
			if(searchOptionCategory[CATEGORY_KOR]){
				result += "recipe_category = '한식' ";
			}
			if(searchOptionCategory[CATEGORY_CHA]){
				if(searchOptionCategory[CATEGORY_KOR]){
					result += "or ";
				}
				result += "recipe_category = '중식' ";
			}
			if(searchOptionCategory[CATEGORY_ENG]){
				if(searchOptionCategory[CATEGORY_KOR] || searchOptionCategory[CATEGORY_CHA]){
					result += "or ";
				}
				result += "recipe_category = '양식' ";
			}
			if(searchOptionCategory[CATEGORY_JPN]){
				if(searchOptionCategory[CATEGORY_KOR] || searchOptionCategory[CATEGORY_CHA] || searchOptionCategory[CATEGORY_ENG]){
					result += "or ";
				}
				result += "recipe_category = '일식' ";
			}
			if(searchOptionCategory[CATEGORY_NIGHT]){
				if(searchOptionCategory[CATEGORY_KOR] || searchOptionCategory[CATEGORY_CHA] || searchOptionCategory[CATEGORY_ENG]
						|| searchOptionCategory[CATEGORY_JPN]){
					result += "or ";
				}
				result += "recipe_category = '야식' ";
			}
			if(searchOptionCategory[CATEGORY_ETC]){
				if(searchOptionCategory[CATEGORY_KOR] || searchOptionCategory[CATEGORY_CHA] || searchOptionCategory[CATEGORY_ENG]
						|| searchOptionCategory[CATEGORY_JPN] || searchOptionCategory[CATEGORY_NIGHT]){
					result += "or ";
				}
				result += "recipe_category = '기타' ";
			}
			result+=") ";
		}
		
		if(searchOptionStr!=""){
			if(!searchOptionTime[DEFAULT] || !searchOptionCategory[DEFAULT]){
				result += "and ";
			}
			switch (searchOptionSelected) {
			case SELECT_TITLE:
				result += "recipe_title like '%"+searchOptionStr+"%' ";
				break;
			case SELECT_CONTENT:
				result += "recipe_simple_comment like '%"+searchOptionStr+"%' ";
				break; 
			case SELECT_TITLE_AND_CONTENT:
				result += "(recipe_title like '%"+searchOptionStr+"%' or recipe_simple_comment like '%"+searchOptionStr+"%') ";
				break;

			default:
				break;
			}
		}
		
		if(searchOptionPrice!="" && searchOptionPrice!=null){
			if(searchOptionPrice.equals("searchOptionPrice_desc")){
				result += "order by recipe_price desc ";
			}else if(searchOptionPrice.equals("searchOptionPrice_asc")){
				result += "order by recipe_price asc ";
			}
		}
		
//		System.out.println("sql : " + result);
		
		return result;
	}
}
