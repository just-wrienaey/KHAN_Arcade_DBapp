/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package arcadeRecord;

import java.util.*;
import java.sql.*;

/**
 *
 * @author ccslearner
 */


public class expenses {
    
    
    public int expensesID;
    public String itemName;
    public String purpose;
    public double itemPrice;
    public String datePurchased;
    
    public ArrayList<Integer> expensesIDList = new ArrayList<>();
    public ArrayList<String>  itemNameList = new ArrayList<>();
    public ArrayList<String>  purposeList = new ArrayList<>();
    public ArrayList<Double>  priceList = new ArrayList<>();
    public ArrayList<String>  dateList = new ArrayList<>();
    
    public int add_expenses(){
        
        
        try{
        
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(expensesID) + 1 AS newID FROM arcade_db.expenses;");
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                expensesID = rst.getInt("newID");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO expenses (expensesID, itemName, purpose, itemPrice, datePurchased) VALUES(?, ?, ?, ?, ?);");
            pstmt.setInt(1, expensesID);
            pstmt.setString(2, itemName);
            pstmt.setString(3, purpose);
            pstmt.setDouble(4, itemPrice);
            pstmt.setString(5, datePurchased);
            
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
        
        expenses E = new expenses();
        
        E.add_expenses();
    
    
    }
    
    
    
}
