package util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class GetTime {
	public static String GetTime(String key) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String time = sdf.format(timestamp);
		return time;
	}
}
