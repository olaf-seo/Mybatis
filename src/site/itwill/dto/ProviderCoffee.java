package site.itwill.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProviderCoffee {
	public static void main(String[] args) {
		String products="아메리카노 카라멜마끼아또 카페모카";
		List<String> productList=null;
		if(products!=null){
			productList=new ArrayList<String>();
			for(String product:products.split(" ")){
				productList.add(product.trim());
			}
		}
		
		String productQtys="100 100 100";
		List<String> productQtyList=null;
		if(productQtys!=null){
			productQtyList=new ArrayList<String>();
			for(String productQty:productQtys.split(" ")){
				productQtyList.add(productQty.trim());
			}
		}
		
		Map<List<String>, List<String>> map= new HashMap<List<String>, List<String>>();
		
		map.put(productList, productQtyList);
		
		
	}		
}

