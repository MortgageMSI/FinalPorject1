package com.mercury.functions;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class toJson {
	
	public JSONArray toJSONArray(ResultSet rs) throws Exception{
		JSONArray json = new JSONArray();
		
		try{
			ResultSetMetaData rsmd = rs.getMetaData();
			
			while(rs.next()){
				int numColumns=rsmd.getColumnCount();
				System.out.println(numColumns);
				JSONObject obj = new JSONObject();
				
				for (int i = 1; i <numColumns+1 ; i++) {
					String column_name =rsmd.getColumnName(i);
					System.out.println(column_name);
					if(rsmd.getColumnType(i)==java.sql.Types.VARCHAR){
						obj.put(column_name, rs.getString(column_name));
					}
					else if(rsmd.getColumnType(i)==java.sql.Types.INTEGER){
						obj.put(column_name, rs.getInt(column_name));
					}
					else if(rsmd.getColumnType(i)==java.sql.Types.NUMERIC){
						obj.put(column_name, rs.getDouble(column_name));
					}
				}
				json.add(obj);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return  json;
		
	}
}
