package com.mercury.functions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class md5Converter {
	public static String convert(String newPassword) throws NoSuchAlgorithmException{
		MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(newPassword.getBytes());
        byte byteData[] = md.digest();
        
        //convert the byte to hex string
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        return sb.toString();
	}
}
