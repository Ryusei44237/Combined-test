package util;

import java.io.UnsupportedEncodingException;

public class GeneratedUTF_8 {
	public static String GUTF_8(String name){
		try {
		      byte[] byteData = name.getBytes("ISO_8859_1");
		      name = new String(byteData, "UTF-8");
		    }catch(UnsupportedEncodingException e){
		    }
		return name;
	}
}
