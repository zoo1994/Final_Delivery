package com.fd.s1.member;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fd.s1.admin.AdminMapper;
import com.fd.s1.admin.AdminService;
import com.fd.s1.shop.ShopService;
import com.fd.s1.shop.ShopVO;
import com.fd.s1.util.Pager;
@SpringBootTest
public class KakaoTest {
	
	private static String GEOCODE_URL="http://dapi.kakao.com/v2/local/search/address.json?query="; 
	private static String GEOCODE_USER_INFO="5a58574ac7b94ffdb63ca1f5c17c22c7";
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminMapper mapper;
	//@Test
	public void test() {
		URL obj;
		try {
			String address = URLEncoder.encode("경기 부천시 오정로 289", "UTF-8");
			obj = new URL(GEOCODE_URL+address);
			HttpURLConnection con = (HttpURLConnection)obj.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization",GEOCODE_USER_INFO);
			con.setDoOutput(true);
			con.setUseCaches(false);
			con.setDefaultUseCaches(false);
			Charset charset =Charset.forName("UTF-8");
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			System.out.println(response.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }
    private static double distance(double lat1, double lon1, double lat2, double lon2) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        dist = dist * 1609.344;
       
 
        return (dist);
    }
	
	//@Test
	public void mathTest()throws Exception{
		Pager pager = new Pager();
		pager.makeRow();
		pager.makeNum(5L);
		List<ShopVO> ar = mapper.getShop(pager);
//		String sx = ar.get(0).getX_axis();
//		String sy = ar.get(0).getY_axis();
//		String sx_1 = ar.get(1).getX_axis();
//		String sy_1 = ar.get(1).getY_axis();
//		double x = Double.parseDouble(sx);
//		double y = Double.parseDouble(sy);
//		double x_1 = Double.parseDouble(sx_1);
//		double y_1 = Double.parseDouble(sy_1);
////		
////		double result = this.distance(y, x, y_1, x_1);
//		System.out.println(result);
		
	}
	
}
