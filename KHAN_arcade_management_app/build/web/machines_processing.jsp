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
        <title>Machines Processing</title>
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
            <jsp:useBean id="M" class="arcadeRecord.machines" scope="session" />
            <% 

                    String v_machineName = request.getParameter("machine_name");
                    M.machineName = v_machineName;
                    String v_tokensRequired = request.getParameter("token_req");
                    try {
                        M.tokensRequired = Integer.parseInt(v_tokensRequired);
                    } catch (NumberFormatException e) {
                        // Handle the case where the parameter is not a valid integer
                        e.printStackTrace(); 
                    }
                    String v_incentive = request.getParameter("incentive_type");
                    M.incentive = v_incentive;
                    String v_ticketsProduced = request.getParameter("tickets");
                    try {
                        M.ticketsProduced = Integer.parseInt(v_ticketsProduced);
                    } catch (NumberFormatException e) {
                        // Handle the case where the parameter is not a valid integer
                        e.printStackTrace();
                    }
                    
                    if (M.incentive.equalsIgnoreCase("ticket")==false )
                        M.ticketsProduced = 0;
                    

                    
                    
                    int status = M.add_machine();

                    if(status == 1) {
            %>
                <h1>Register Machine Successful</h1>
                
                <%if (M.incentive.equalsIgnoreCase("ticket")==false ){%>
                <h6>*Machines that provide incentives other than tickets cannot produce tickets; data adjusted accordingly</h6>
                <% } %>
                
            <% } else { %>
                <h1>Register Machine Failed</h1>
            <% } %>
            <input type="submit" value="Back to main menu">
        </form>
    </body>
</html>
