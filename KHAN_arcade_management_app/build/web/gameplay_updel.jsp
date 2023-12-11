<%-- 
    Document   : 
    Created on : 12 2, 23, 4:09:23 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, arcadeRecord.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Machine Record</title>
        <style>
            body{
                color: #ffd166;
                background-color: #073b4c;
                text-align: center;
            }
  
            label{
                font-size: 50px;
            }
            
            p{
                font-size: 40px;
            }
            
            
            button{
                font-size: 35px;
                margin: 10px;
                border-radius: 10px;
                color: white;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="G" class="arcadeRecord.gameplay" scope="session" />


        <form action="gameplay_updel.jsp" method="post">
             <label for="del_gameplay"> Gameplay ID: </label>
                <% 
                    G.fetchMinMaxID();
                    out.print("<input type=\"number\" id=\"del_gameplay\" name=\"del_gameplay\" min=\"" + G.minID + "\" step=\"1\" max=\"" + G.maxID + "\">");

                    String v_gameplayID = request.getParameter("del_gameplay");
                    try {
                          int selectedID = Integer.parseInt(v_gameplayID);
                          G.selectedID = selectedID;
                          G.fetchRow();
                    } catch (NumberFormatException e) {
                          // Handle the case where the parameter is not a valid integer
                          e.printStackTrace(); 
                    }
                %>
            <input type="submit" value="search">
        </form>

            
                <p>Gameplay ID: <%= G.display_gameplayID %></p>
                <p>Machine ID: <%= G.display_machineID %></p>
                <p>Total Player: <%= G.display_playersQTY %></p>
                <p>Total Winners: <%= G.display_winnersQTY %></p>
                <p>Date: <%= G.display_date %></p>
    
            
            <form action="gameplay_update.jsp">
                <% G.selectedID = G.display_gameplayID ; %>
                <input type="submit" value="UPDATE">
            </form>
            <form action="gameplay_delete_processing.jsp"><input type="submit" value="DELETE"></form>


        
        
        

       
       
                     
    </body>
</html>
