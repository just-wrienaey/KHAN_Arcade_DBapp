/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package arcadeRecord;

/**
 *
 * @author ccslearner
 */
import java.util.*;
import java.sql.*;

public class token {
    
    public int tokenVersion;
    public double price;
    public String date;
    
    public ArrayList<Integer> tokenVersionList = new ArrayList<>();
    public ArrayList<Double>  priceList = new ArrayList<>();
    public ArrayList<String>  dateList = new ArrayList<>();
    
    public int add_token(){
        
        if(price==0)
            return 0;
        
        try{
        
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(tokenVersion) + 1 AS newVersion FROM arcade_db.token_conversion;");
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                tokenVersion = rst.getInt("newVersion");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO token_conversion(tokenVersion, price, dateImplemented) VALUES(?, ?, ?);");
            pstmt.setInt(1, tokenVersion);
            pstmt.setDouble(2, price);
            
            System.out.println(date);
            pstmt.setString(3, date);
            
            pstmt.executeUpdate();
            
            
            pstmt.close();
            conn.close();
            System.out.println("return 1");
            return 1;
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
   
    
    }

    
    public static void main(String args[]){
        
        token T = new token();
        
        T.add_token();
    
    
    }
    
}
