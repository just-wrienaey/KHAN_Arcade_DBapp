/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package arcadeRecord;

import java.sql.*;
import java.util.*;

/**
 *
 * @author ccslearner
 */
public class reports {
    
    public int month;
    
    public ArrayList<Integer> monthList = new ArrayList<>();
    
    public int gMachineID;
    public String gMachineName;
    public int gTotalPlayers;
    
    public int gameOfTheMonth(){
        
        fetchMonths();
        if(!monthList.contains(month))
            return 0;
        
        try{
        
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
         
         String sql = "SELECT MONTH(g.date), g.machineID, m.machineName, SUM(g.playersQTY) AS total "
                    + "FROM gameplay g JOIN machines m ON g.machineID = m.machineID "
                    + "WHERE MONTH(g.date) = ? GROUP BY g.machineID, MONTH(g.date) ORDER BY total DESC LIMIT 1;";
        
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, month);
        
        ResultSet resultSet = pstmt.executeQuery();
        
        while (resultSet.next()) {
            gMachineID = resultSet.getInt("machineID");
            gMachineName = resultSet.getString("machineName");
            gTotalPlayers = resultSet.getInt("total");
        }
        
        return 1;
        
        } catch(Exception e){
            
            System.out.println(e.getMessage());
            return 0;
        
        }
        
         
    }
    
    public void fetchMonths(){
     

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            String sql = "SELECT DISTINCT MONTH(g.date) AS month FROM gameplay g";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int month = rs.getInt("month");
                monthList.add(month);
            }

            // Now, monthList contains all the unique months available in the database
            System.out.println("Month List: " + monthList);
            
            rs.close();
            pstmt.close();
            conn.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        
    
    }
    
    public static void main(String args[]){
        
        reports R = new reports();
        
        
        
        
    }
    
}
