<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Gameplay</title>
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

<div id="pageTitle">ADD GAMEPLAY RECORD</div>

<div id="form">
    <form action="gameplay_processing.jsp" method="post">
        <jsp:useBean id="G" class="arcadeRecord.gameplay" scope="session" />

        <section>
            <!-- CONNECT TO SQL TO FETCH DROPDOWN OPTIONS -->
            <label for="machine_id">Machine Name: </label>
            <select id="machine_id" name="machine_id">
            <% 
                G.fetchMachines();
                for(int i = 0; i< G.machineIDList.size(); i++) {
                out.println("<option value=" + G.machineIDList.get(i) + ">" + G.machineNameList.get(i) + "</option>");
       
            }%>
                
                
            </select>
        </section>

        <br><br>

        <section>
            <label for="playersQTY">TOTAL Number of Players: </label>
            <input type="number" id="playersQTY" name="playersQTY" min="0" step="1">
        </section>

        <br><br>

        <section>
            <label for="winnersQTY">TOTAL Number of Winners: </label>
            <input type="number" id="winnersQTY" name="winnersQTY" min="0" step="1">
        </section>

        <br><br>

        <section>
            <label for="date">Date: </label>
            <input type="date" id="date" name="date">
        </section>

        <button type="submit">Submit</button>

    </form>
</div>

</body>
</html>
