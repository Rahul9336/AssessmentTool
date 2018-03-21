package patientconfig;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbcon {
	static Connection con=null;
	static{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/examdesk","root","");
			}catch(Exception e){
				System.out.println("Unable To connect");
			}
	}
	public static Connection getCon(){
		return con;
	}
}
