package service.jang.hs;

import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

 import dto.jang.hs.AroundAllVO2;
import dto.jang.hs.AvgAllPriceVO2;
import dto.jang.hs.Top10Vo2;
import dto.jang.hs.detail2;

public interface OilService {

	
	 public   String readAvgCityPrice(String sidocode)throws Exception;
	 public   HashMap<String,Double> getAvgCityPrice(String sidocode)throws Exception;
	 public   String readavgAllPrice()throws Exception;
	 public   AvgAllPriceVO2 getavgAllPrice()throws Exception;
	 public   LinkedHashMap<String,String> getSm(String area)throws Exception;
	 public   String readUrl(String area)throws Exception;
	 public   String readlowTop10(String area,String prodcd)throws Exception;
	 public   ArrayList<Top10Vo2> getlowTop10(String area,String prodcd)throws Exception;
// public static  xy getdistance(String van_addr,String new_addr)throws Exception;
	 public   String readDetailInfo(String code) throws Exception;
	 public   detail2 getDetailInfo(String code) throws Exception;
	 public   String readAroundAll(String x,String y,String radius,String prodcd,String sort)throws Exception;
	 public   ArrayList<AroundAllVO2> getAroundAll(String x,String y,String radius,String prodcd,String sort)throws Exception;
	 public   String getIdByAddress(String address)throws IOException;
}