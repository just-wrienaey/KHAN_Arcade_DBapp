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
                    
                    int status = G.deleteGameplay();

                    if(status == 1) {
            %>
                <h1>Delete Gameplay Record Successful</h1>
                
      
            <% } else { %>
                <h1>Delete Gameplay Record Failed</h1>
            <% } %>
            <input type="submit" value="Back to main menu">
        </form>
    </body>
</html>