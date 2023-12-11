<%-- 
    Document   : machines_delete
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
        <jsp:useBean id="M" class="arcadeRecord.machines" scope="session" />


        <form action="machines_updel.jsp" method="post">
             <label for="del_machine"> Machine ID: </label>
                <% 
                    M.fetchMinMaxID();
                    out.print("<input type=\"number\" id=\"del_machine\" name=\"del_machine\" min=\"" + M.minID + "\" step=\"1\" max=\"" + M.maxID + "\">");

                    String v_machineID = request.getParameter("del_machine");
                    try {
                          int selectedID = Integer.parseInt(v_machineID);
                          M.fetchRow(selectedID);
                    } catch (NumberFormatException e) {
                          // Handle the case where the parameter is not a valid integer
                          e.printStackTrace(); 
                    }
                %>
            <input type="submit" value="search">
        </form>

            
            <p>Machine ID: <%= M.displayID %></p>
            <p>Machine Name: <%= M.displayName %></p>
            <p>Tokens Required: <%= M.displayTokens %></p>
            <p>Incentive Type: <%= M.displayIncentive %></p>
            <p>Tickets Produced: <%= M.displayTicket %></p>
    
            
            <form action="machines_update.jsp"><input type="submit" value="UPDATE"></form>
            <form action="machines_delete_processing.jsp"><input type="submit" value="DELETE"></form>


        
        
        

       
       
                     
    </body>
</html>
