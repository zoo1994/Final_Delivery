package com.fd.s1.member;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import org.junit.jupiter.api.Test;

public class KakaoTest {
	
	private static String GEOCODE_URL="http://dapi.kakao.com/v2/local/search/address.json?query="; 
	private static String GEOCODE_USER_INFO="5a58574ac7b94ffdb63ca1f5c17c22c7";
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
	
}
