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
import java.sql.*;
import java.util.*;



public class gameplay {
    
    //gamelplay attributes
    public int gameplayID;
    public int machineID;
    public int playersQTY;
    public int winnersQTY;
    public String date;
    
    //machine name and ID
    public ArrayList<String> machineNameList = new ArrayList<>();
    public ArrayList<Integer> machineIDList = new ArrayList<>();
    
    public gameplay(){
        fetchMachines();
    }
    
    public void fetchMachines(){
        
        machineIDList.clear();
        machineNameList.clear();
        
            try{
        
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT machineID AS ID, machineName AS NAME FROM arcade_db.machines;");
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                machineIDList.add(rst.getInt("ID"));
                machineNameList.add(rst.getString("NAME"));
//                System.out.println(machineNameList);
            }
            
  
            
            pstmt.close();
            conn.close();
//            System.out.println("return 1");
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
    }
    
    public int add_gameplay(){
    
        try{
            
            if (playersQTY < winnersQTY)
                   return 0;
        
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(gameplayID) + 1 AS newID FROM arcade_db.gameplay;");
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                gameplayID = rst.getInt("newID");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO gameplay (gameplayID, machineID, playersQTY, winnersQTY, date) VALUES(?, ?, ?, ?, ?);");
            pstmt.setInt(1, gameplayID);
            pstmt.setInt(2, machineID);
            pstmt.setInt(3, playersQTY);
            pstmt.setInt(4, winnersQTY);
            pstmt.setString(5, date);
            
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

                PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(gameplayID)AS maxID FROM arcade_db.gameplay;");
                ResultSet rst = pstmt.executeQuery();

                while (rst.next()) {
                    maxID = rst.getInt("maxID");
                }

                pstmt = conn.prepareStatement("SELECT MIN(gameplayID)AS minID FROM arcade_db.gameplay;");
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
    
    public int display_gameplayID;
    public int display_machineID;
    public int display_playersQTY;
    public int display_winnersQTY;
    public String display_date;
    
    public int selectedID;

    public int fetchRow(){
        
        try {
            
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
                
            String query = "SELECT * FROM gameplay WHERE gameplayID = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, selectedID);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                
                display_gameplayID = resultSet.getInt("gameplayID");
                display_machineID = resultSet.getInt("machineID");
                display_playersQTY = resultSet.getInt("playersQTY");
                display_winnersQTY = resultSet.getInt("winnersQTY");;
                display_date = resultSet.getString("date");
                
            }

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
    
    
    
    public int deleteGameplay(){
        
               try{
        
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM arcade_db.gameplay WHERE gameplayID = ?;");
            
            pstmt.setInt(1, selectedID);
           
            System.out.println(selectedID); 
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
    
    
    
    public int update_gameplay(){
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arcade_db?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE arcade_db.gameplay SET machineID = ?, playersQTY = ?, winnersQTY = ?, date = ? WHERE gameplayID = ?;");
            
            System.out.println(display_gameplayID);
            
            pstmt.setInt(1, machineID);
            pstmt.setInt(2, playersQTY);
            pstmt.setInt(3, winnersQTY);
            pstmt.setString(4, date);
            pstmt.setInt(5, display_gameplayID);
            
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
    
        gameplay G = new gameplay();
        
        G.add_gameplay();
    
    
    }
    
    
}
