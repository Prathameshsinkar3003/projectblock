package com.algo;

import java.security.SecureRandom;
import java.util.Random;

public class KeyGeneration {
	
	public String blowFishKey(String fileName)
	{
		char[] characterSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
		int length=10;
		String filekey=null;
						
			 Random random1 = new SecureRandom();
			    char[] result = new char[length];
			    for (int i = 0; i < result.length; i++) {
			        // picks a random index out of character set > random character
			        int randomCharIndex = random1.nextInt(characterSet.length);
			        result[i] = characterSet[randomCharIndex];
			    }
			    filekey=new String(result);
			    System.out.println("result:"+ filekey);
				return filekey;

		
	}

}
