

<%@page import="java.io.IOException"%>
<%@page import="com.chillyfacts.com.AddScorePlayer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%!
    public String Player1 = "Love", Player2 = "Love";
    String Result = "Love-ALL";
     int m_score1 = 0;
     int m_score2 = 0;
    public void AddScorePlayer1Tennis() {
        try {
            System.out.print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            AddScorePlayer hm = new AddScorePlayer();
            hm.AddScorePlayer(1);
            Player1 = hm.GetPlayer1();
        } catch (IOException e) {

        }
    }

    public void AddScorePlayer2Tennis() {
        try {
            System.out.print("2222222222222222222222");
            AddScorePlayer hm = new AddScorePlayer();
            hm.AddScorePlayer(2);
            Player2 = hm.GetPlayer2();
        } catch (IOException e) {

        }
    }
%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style> @import url("https://fonts.googleapis.com/css?family=IBM+Plex+Mono:700&display=swap");
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }
            :root {
                font-size: calc(0.9vw + 0.9vh + 0.5vmin);
            }
            body {
                background: #e9e1d2 repeating-linear-gradient(135deg, transparent, transparent 1em, rgba(255, 255, 255, 0.1) 1em, rgba(255, 255, 255, 0.1) 2em);
                color: #f7f6f3;
                font-family: "IBM Plex Mono", monospace;
                font-size: 1em;
                height: 100vh;
            }
            button {
                background: #5eb6e8;
                border: 5px solid transparent;
                border-radius: 10px;
                box-shadow: 0 9px #6d66d4;
                color: #f7f6f3;
                cursor: pointer;
                display: inline-block;
                font-family: "IBM Plex Mono", monospace;
                font-size: 1.5em;
                margin: 0 auto 0.5em;
                outline: none;
                padding: 1em;
                text-align: center;
                text-decoration: none;
                text-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
                transition-duration: 0.2s;
                width: 13em;
            }
            button:disabled {
                background: #5eb6e8 repeating-linear-gradient(45deg, transparent, transparent 1em, rgba(255, 255, 255, 0.1) 1em, rgba(255, 255, 255, 0.1) 2em);
                cursor: not-allowed;
                pointer-events: none;
            }
            button:hover {
                border-color: rgba(0, 0, 0, 0.2);
            }
            button:active {
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }
            .game span {
                position: relative;
                right: 0;
            }
            .box {
                display: flex;
                justify-content: space-evenly;
                margin: 2em auto;
                padding: 1em 2em;
                width: 15em;
            }
            .lives-box {
                padding: 0;
            }
            .lives {
                font-size: 3em;
            }
            .stats {
                background: #eccaaf;
                border: 0.3em #a33d62 solid;
                color: #a33d62;
                line-height: 1.8;
                margin: 2em;
                padding: 1em;
            }
            h3 {
                padding: 0.5em;
                text-decoration: underline;
            }
            .box .counter {
                text-align: left;
            }
            .container {
                display: grid;
                grid-template-columns: 1fr 1fr;
                text-align: center;
            }
            .game {
                margin: 0 auto;
                text-align: center;
                text-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
            }
            .counter {
                position: absolute;
                right: 0;
            }
            .points-box {
                background: #f45689;
            }
            .score-box {
                background: #f4a262;
            }
            .player-box {
                background: #9f81c1;
            }
            .lives-box {
                background: #ff7575;
            }
            .odometer.odometer-auto-theme {
                display: inline-block;
                vertical-align: middle;
                *vertical-align: auto;
                *zoom: 1;
                *display: inline;
                position: relative;
            }
            .odometer.odometer-auto-theme .odometer-digit {
                display: inline-block;
                vertical-align: middle;
                *vertical-align: auto;
                *zoom: 1;
                *display: inline;
                position: relative;
            }
            .odometer.odometer-auto-theme .odometer-digit .odometer-digit-spacer {
                display: inline-block;
                vertical-align: middle;
                *vertical-align: auto;
                *zoom: 1;
                *display: inline;
                visibility: hidden;
            }
            .odometer.odometer-auto-theme .odometer-digit .odometer-digit-inner {
                text-align: left;
                display: block;
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                overflow: hidden;
            }
            .odometer.odometer-auto-theme .odometer-digit .odometer-ribbon {
                display: block;
            }
            .odometer.odometer-auto-theme .odometer-digit .odometer-ribbon-inner {
                display: block;
                -webkit-backface-visibility: hidden;
            }
            .odometer.odometer-auto-theme .odometer-digit .odometer-value {
                display: block;
                -webkit-transform: translateZ(0);
            }
            .odometer.odometer-auto-theme .odometer-digit .odometer-value.odometer-last-value {
                position: absolute;
            }
            .odometer.odometer-auto-theme.odometer-animating-up .odometer-ribbon-inner {
                transition: transform 0.9s;
            }
            .odometer.odometer-auto-theme.odometer-animating-up.odometer-animating .odometer-ribbon-inner {
                transform: translateY(-100%);
            }
            .odometer.odometer-auto-theme.odometer-animating-down .odometer-ribbon-inner {
                transform: translateY(-100%);
            }
            .odometer.odometer-auto-theme.odometer-animating-down.odometer-animating .odometer-ribbon-inner {
                transition: transform 0.9s;
                transform: translateY(0);
            }
            @media only screen and (max-width: 690px) {
                .container {
                    grid-template-columns: 1fr;
                }
            }
        </style>
    </head>
    <body>




        <%

            try {
                AddScorePlayer hm = new AddScorePlayer();
                String nbrPlayer = request.getParameter("player");
                Player1 = "Love";
                Player2 = "Love";
                
                if(Player1.equals("Win Game")||Player2.equals("Win Game"))
                {Result = "Love-All";
                    m_score1 = 0;
                   m_score2 = 0;
                   
                }
                if (nbrPlayer != null && nbrPlayer.equals("1")) {
                    hm.AddScorePlayer(1);
                    Player1 = hm.GetPlayer1();
                    Player2 = hm.GetPlayer2();
                    m_score1 += 1;

                } else if (nbrPlayer != null && nbrPlayer.equals("2")) {
                    hm.AddScorePlayer(2);
                    Player1 = hm.GetPlayer1();
                    Player2 = hm.GetPlayer2();
                       m_score2 += 1;
                }
                else if (nbrPlayer != null && nbrPlayer.equals("0"))
                {Result = "Love-All";
                     m_score1 = 0;
                   m_score2 = 0;
                     hm.AddScorePlayer(3);
                     
                  
                   
                }
                    String score = "";
        int tempScore=0;
        if (m_score1==m_score2)
        {
            switch (m_score1)
            {
                case 0:
                        score = "Love-All";
                    break;
                case 1:
                        score = "Fifteen-All";
                    break;
                case 2:
                        score = "Thirty-All";
                    break;
                default:
                        score = "Deuce";
                    break;
                
            }
        }
        else if (m_score1>=4 || m_score2>=4)
        {
            int minusResult = m_score1-m_score2;
            if (minusResult==1) score ="Advantage player1";
            else if (minusResult ==-1) score ="Advantage player2";
            else if (minusResult>=2){ 
                score = "Win for player1";
                  }
            else{ score ="Win for player2";
                 }
        }
        else
        {
            for (int i=1; i<3; i++)
            {
                if (i==1) tempScore = m_score1;
                else { score+="-"; tempScore = m_score2;}
                switch(tempScore)
                {
                    case 0:
                        score+="Love";
                        break;
                    case 1:
                        score+="Fifteen";
                        break;
                    case 2:
                        score+="Thirty";
                        break;
                    case 3:
                        score+="Forty";
                        break;
                }
            }
        }
        Result=score;
        
            } catch (Exception e) {

            }

        %>

        <div class="container">
            <div class="game">
                 <div class="box score-box"><div class="label">Result:<%=Result%> </div></div>
                <form action="http://localhost:8080/TennisGameProject?player=1" method="POST">

                    <button name="player" value="1" type="submit"  id="addScorePlayer1"   >Point won by player 1 :<%=Player1%></button>
                </form>
                <form action="http://localhost:8080/TennisGameProject?player=2" method="POST">
                    <button name="player" value="2" type="submit"  id="addScorePlayer2"   >Point won by player 2 :<%=Player2%></button>
                </form>
             <form action="http://localhost:8080/TennisGameProject?player=0" method="POST">
                    <button name="player" value="0" type="submit"  id="resetButton" >reset</button>
             </form>
               

            </div>

        </div>
        <script>
            window.odometerOptions = {
                format: 'd',
                duration: 1000
            };
        </script>
    
    </body>
</html>

