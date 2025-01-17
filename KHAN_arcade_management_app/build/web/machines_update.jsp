<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add Machine</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <style>
            :root {
                --pink: #ef476f;
                --yellow: #ffd166;
                --green: #06d6a0;
                --blue: #118ab2;
                --dark-blue: #073b4c; 
            }

            body {
                text-align: center;
                background-color: var(--dark-blue);
                color: #fff;
                font-family: Arial, sans-serif;
            }


            #pageTitle {
                font-family: monospace;
                letter-spacing: 10px;
                font-size: 50px;
                padding: 28px;
                text-align: center;
                color: var(--pink);
            }

            label {
                font-family: monospace;
                font-size: 40px;
                color: var(--yellow);
            }

            section {
                display: flex;
                flex-direction: column;
                padding: 25px;
            }
            
            input, option, select{
                font-size: 30px;
            }
            
            form{
                margin-left: 250px;
                margin-right: 250px;
            }
            
            button{
                margin: 10px;
                border-radius: 10px;
                background-color: var(--pink);
                color: white;
                font-size: 30px;
            }

            
        </style>
    </head>
    <body>
        
        <div id="pageTitle">ADD MACHINE RECORD</div>
        
        <div id="form">
            <form action="machines_update_processing.jsp" method="post">
                <jsp:useBean id="M" class="arcadeRecord.machines" scope="session" />

                <section>
                    <h3> Machine ID: <% out.println(M.selectedID); %> </h3>
                </section>
                <section>
                    <label for="machine_name">Machine Name: </label>
                    <input type="text" id="machine_name" name="machine_name">
                </section>
                
                <br><br>
                
                <section>
                    <label for="token_req">Token/s Required: </label>
                    <input type="number" id="token_req" name="token_req" min="1" step="1" max="5">
                </section>
                
                <br><br>
                
                <section>
                    <label for="incentive_type">Incentive Type: </label>
                        <select id="incentive_type" name="incentive_type" >
                            <option value="ticket">Ticket</option>
                            <option value="coin">Coin</option>
                            <option value="toy">Toy</option>
                        </select>
                </section>
                
                <section>
                    <label for="tickets">Tickets Produced: </label>
                    <input type="number" id="tickets" name="tickets" min="0" step="1" >
                </section>
                
                <button type="submit">Submit</button>
                
            </form>
        </div>
    </body>
</html>
