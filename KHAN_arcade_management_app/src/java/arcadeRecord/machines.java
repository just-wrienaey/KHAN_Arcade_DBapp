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

public class machines {
    
    public int machineID;
    public String machineName;
    public int tokensRequired;
    public String incentive;
    public int ticketsProduced;
    
    public ArrayList<Integer> machineIdList = new ArrayList<>();
    public ArrayList<String> machineNameList = new ArrayList<>();
    public ArrayList<Integer> tokensRequiredList = new ArrayList<>();
    public ArrayList<String> incentiveList = new ArrayList<>();
    public ArrayList<Integer> ticketsProducedList = new ArrayList<>();
    
       
    public int add_machine(){
        
        if(machineName==null || tokensRequired==0)
            return 0;
        
        try{
        
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(machineID) + 1 AS newMachineID FROM arcade_db.machines;");
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                machineID = rst.getInt("newMachineID");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO machines(machineID, machineName, tokensRequired, incentive, ticketsProduced) VALUES(?, ?, ?, ?, ?);");
            pstmt.setInt(1, machineID);
            pstmt.setString(2, machineName);
            pstmt.setInt(3, tokensRequired);
            pstmt.setString(4, incentive);
            pstmt.setInt(5, ticketsProduced);
            
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
    
    public int maxID, minID;
    
    public void fetchMinMaxID(){
    
        try{

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
                System.out.println("Connection Successful");

                PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(machineID)AS maxID FROM arcade_db.machines;");
                ResultSet rst = pstmt.executeQuery();

                while (rst.next()) {
                    maxID = rst.getInt("maxID");
                }

                pstmt = conn.prepareStatement("SELECT MIN(machineID)AS minID FROM arcade_db.machines;");
                rst = pstmt.executeQuery();

                while (rst.next()) {
                    minID = rst.getInt("minID");
                }

                pstmt.close();
                conn.close();

        } catch(Exception e) {
            System.out.println(e.getMessage());

        }
    
    
    }
    
    public int displayID;
    public String displayName;
    public int displayTokens;
    public String displayIncentive;
    public int displayTicket;
    
    public int selectedID;

    public int fetchRow(int selectedID){
        
        try {
            
            this.selectedID = selectedID;
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
                
            String query = "SELECT * FROM machines WHERE machineID = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, selectedID);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                displayID= resultSet.getInt("machineID");
                displayName = resultSet.getString("machineName");
                displayTokens= resultSet.getInt("tokensRequired");
                displayIncentive = resultSet.getString("incentive");
                displayTicket= resultSet.getInt("ticketsProduced");
            }

            System.out.println(displayName);
            // Close resources
            resultSet.close();
            preparedStatement.close();
            conn.close();
            
            return 1;
            
        } catch(Exception e) {
            System.out.println(e.getMessage());
            return 0;

        }
        
    }
    
    public int deleteMachine(){
        
               try{
        
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM arcade_db.machines WHERE machineID = ?;");
            
            pstmt.setInt(1, selectedID);
           
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
    
        public int update_machines(){
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE arcade_db.machines SET machineName = ?, tokensRequired = ?, incentive = ?, ticketsProduced = ? WHERE machineID = ?;");
            
            System.out.println(displayID);
            
            pstmt.setString(1, machineName);
            pstmt.setInt(2, tokensRequired);
            pstmt.setString(3, incentive);
            pstmt.setInt(4, ticketsProduced);
            pstmt.setInt(5, displayID);
            
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
    
    public static void main(String args[]){
        
        machines M = new machines();
        
//        M.add_machine();
    
    
    }
    

}
