<%-- 
    Document   : expenses_processing
    Created on : 12 1, 23, 9:57:40 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, arcadeRecord.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gameplay Processing</title>
        <style>
            body{
                color: white;
                background-color: #073b4c;
                text-align: center;
            }
            
            h1{
                font-size: 70px;
            }
            
            h6{
                font-size: 25px;
            }
            
            button{
                margin: 10px;
                border-radius: 10px;
                color: white;
                font-size: 30px;
            }
        </style>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id="G" class="arcadeRecord.gameplay" scope="session" />
            <% 
                    String v_machineID = request.getParameter("machine_id");
                    try {
                        G.machineID = Integer.parseInt(v_machineID);
                    } catch (NumberFormatException e) {
                        // Handle the case where the parameter is not a valid integer
                        e.printStackTrace(); 
                    }
                    String v_playersQTY = request.getParameter("playersQTY");
                    try {
                        G.playersQTY = Integer.parseInt(v_playersQTY);
                    } catch (NumberFormatException e) {
                        // Handle the case where the parameter is not a valid integer
                        e.printStackTrace(); 
                    }
                    String v_winnersQTY = request.getParameter("winnersQTY");
                    try {
                        G.winnersQTY = Integer.parseInt(v_winnersQTY);
                    } catch (NumberFormatException e) {
                        // Handle the case where the parameter is not a valid integer
                        e.printStackTrace(); 
                    }
                    G.date = request.getParameter("date");
                    
                    int status =  G.add_gameplay();

                    if(status == 1) {
            %>
                <h1>Register Gameplay Successful</h1>
                
                
            <% } else { %>
                <h1>Register Gameplay Failed</h1>
                
                
                
            <% if(G.playersQTY<G.winnersQTY){ %>
                <h6>*Number of players cannot be less than the number of winners</h6>
            <% }} %>
            <input type="submit" value="Back to main menu">
        </form>
    </body>
</html>