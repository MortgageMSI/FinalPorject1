package com.mercury.functions;

import java.util.Random;

public class randomGenerator{
	private static final String AB = "0123456789abcdefghijklmnopqrstuvwxyz";
	private static Random rnd = new Random();

	public static  String randomString( int len ) {
	   StringBuilder sb = new StringBuilder( len );
	   for( int i = 0; i < len; i++ ) 
	      sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
	   return sb.toString();
	}
}
