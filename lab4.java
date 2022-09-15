package lab4;

import java.util.*;
import java.sql.*;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

public class lab4 {
	
	static final String DB_URL = "jdbc:mysql://localhost:3306/user";   
	static final String USER = "root";   
	static final String PASS = "";
	   
	public static void main(String[] args) throws SQLException, ClassNotFoundException { 
		
		Class.forName("oracle.jdbc.driver.OracleDriver");		
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:3306:orcl","root","");
         
        //Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);

		Scanner s = new Scanner(System.in);
                     
		PreparedStatement ps = connection.prepareStatement("INSERT INTO Pokemon VALUES(?,?,?,?,?)");
                           
		while(true) {           
			System.out.println("POKEMON DATABASE");	                 
			System.out.println("1.Add");	                 
			System.out.println("2.Display");	             
			System.out.println("3.Exit");	      
			System.out.println("\nChoose one of the following: ");
                                 
			int choice = s.nextInt();  
                
			s.nextLine();
               
			if(choice == 1) {                      
				System.out.println("Enter pokemon name: ");                      
				String pname = s.nextLine();                                 
				System.out.println("Enter pokemon type 1: ");                   
				String ptype1 = s.nextLine();     
				System.out.println("Enter pokemon type 2: ");                    
				String ptype2 = s.nextLine();                  
				System.out.println("Enter pokemon ability: ");                  
				String pability = s.nextLine();
				System.out.println("Enter the generation this pokemon is from: ");                  
				String pgeneration = s.nextLine();
                   
				ps.setString(1, pname);                
				ps.setString(2, ptype1);                                    
				ps.setString(3, ptype2);                 
				ps.setString(4, pability);
				ps.setString(5, pgeneration);
               
				int k = ps.executeUpdate();   
               
				if(k == 1)
					System.out.println("Successfully Added!");      
			}
                   
			if(choice == 2) {                  
				System.out.println("Enter pokemon name: ");                    
				String pname = s.nextLine();                    
                                           
				PreparedStatement ps1 = connection.prepareStatement("SELECT *FROM Pokemon WHERE pname=?");                   
				ps1.setString(1, pname);                                     
				ResultSet rs = ps1.executeQuery();
                 
				if(rs.next()) {                   
					System.out.println("Name\tType 1\tType 2\tAbility\tGeneration");                   
					System.out.println("----------------------------------------------");                          
					System.out.println(rs.getString(1) + "\t" + rs.getString(2) + "\t" + rs.getString(3) + "\t" + rs.getString(4) + "\t" + rs.getString(5));                       
				}              
				else
					System.out.println("Pokemon Does Not Exist");
                       
				connection.close();               
			}
			
			if(choice == 3)
				System.exit(0);	
		}                 	
	}
}