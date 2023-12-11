

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
  
            option, select{
                font-size: 30px;
            }
            
            label{
                font-size: 45px;
            }
            
            h2{
                font-size: 50px;
            }
            
            
            button{
                font-size: 35px;
                margin: 10px;
                border-radius: 10px;
                color: white;
            }
            
            table {
                margin: 20px auto; /* Center the table horizontally */
                border-collapse: collapse;
                width: 80%;
            }

            th, td {
                font-size: 35px;
                padding: 15px;
                border: 1px solid white;
            }


        </style>
    </head>
    <body>
        <jsp:useBean id="R" class="arcadeRecord.reports" scope="session" />


        <form action="display_gameOfMonth.jsp" method="post">
            <label for="month">Month:</label>
                <select id="month" name="month">
                    <option value="" >Select month</option>
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>

                
            <input type="submit" value="enter">
            
            <%
               
                String month = request.getParameter("month");
                    try {
                          int monthNum = Integer.parseInt(month);
                          R.month = monthNum;
                          R.gameOfTheMonth();
                    } catch (NumberFormatException e) {
                          // Handle the case where the parameter is not a valid integer
                          e.printStackTrace(); 
                    }
            %>
            
        </form>
        
            
         <h2>Month: <%
             
        switch (R.month) {
                   case 1:
                       out.println("January");
                       break;
                   case 2:
                       out.println("February");
                       break;
                   case 3:
                       out.println("March");
                       break;
                   case 4:
                       out.println("April");
                       break;
                   case 5:
                       out.println("May");
                       break;
                   case 6:
                       out.println("June");
                       break;
                   case 7:
                       out.println("July");
                       break;
                   case 8:
                       out.println("August");
                       break;
                   case 9:
                       out.println("September");
                       break;
                   case 10:
                       out.println("October");
                       break;
                   case 11:
                       out.println("November");
                       break;
                   case 12:
                       out.println("December");
                       break;
                   default:
                       System.out.println("Invalid month number. Please enter a number between 1 and 12.");
               }
             
             %> </h2>
             

            <% if(R.gameOfTheMonth()==0) { %>
            <h2>*No records available for this month!</h2>
            <% }else{ %>
                <table border="1">
                <thead>
                    <tr>
                        <th>Machine ID</th>
                        <th>Machine Name</th>
                        <th>Total Players</th>
                    </tr>
                </thead>
                <tbody>
                        <tr>
                            <td><%= R.gMachineID %></td>
                            <td><%= R.gMachineName %></td>
                            <td><%= R.gTotalPlayers %></td>
                        </tr>
                </tbody>
            </table>
            <% } %>
                
            

            
            <form action="index.html"><input type="submit" value="Main Menu"></form>
            
    </body>
</html>
