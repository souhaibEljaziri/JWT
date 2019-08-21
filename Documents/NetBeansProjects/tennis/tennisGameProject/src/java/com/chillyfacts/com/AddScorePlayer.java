package com.chillyfacts.com;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;

public class AddScorePlayer {

    public String Player1 = "Love";
    public String Player2 = "Love";
    public String Result = "";
    public String Json = "";

    public JSONObject AddScorePlayer(int nbplayer) throws IOException {
       
        Json = MyGETRequest(nbplayer);
        JSONObject obj2 = new JSONObject(Json);
        this.Player1 = obj2.getString("player1");
        this.Player2 = obj2.getString("player2");

        return obj2;
    }
 public void reset() throws MalformedURLException, IOException
 {
       URL urlForGetRequest = new URL("https://stormy-oasis-59105.herokuapp.com/score/endGame");
          String readLine = null;
        HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
        conection.setRequestMethod("GET");
 }
    public String GetPlayer1() throws IOException {
        return this.Player1;

    }

    public String GetPlayer2() {
        return Player2;

    }

    void addScorePlayer() {

        AddScorePlayer player = new AddScorePlayer();
        this.Player1 = player.Player1;
        this.Player2 = player.Player2;
        System.out.println(player.Json);

    }

    public static String MyGETRequest(int nbplayer) throws IOException {
        if(nbplayer<=2)
        {
        String url = "https://stormy-oasis-59105.herokuapp.com/score";
        URL urlForGetRequest = new URL(url+"?player="+nbplayer);
//URL urlForGetRequest = new URL("https://tennis-score-api.herokuapp.com/score");
        String readLine = null;
        HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
        conection.setRequestMethod("GET");

        int responseCode = conection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(conection.getInputStream()));
            StringBuffer response = new StringBuffer();
            while ((readLine = in.readLine()) != null) {
                response.append(readLine);
            }
            in.close();
            // print result
            System.out.println(response.toString());

            return response.toString();
            //GetAndPost.POSTRequest(response.toString());        
        } else {
            System.out.println("GET NOT WORKED");
        }
        }
        else
        {
              URL urlForGetRequest = new URL("https://stormy-oasis-59105.herokuapp.com/score/endGame");
          String readLine = null;
        HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
        conection.setRequestMethod("GET");
               int responseCode = conection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(conection.getInputStream()));
            StringBuffer response = new StringBuffer();
            while ((readLine = in.readLine()) != null) {
                response.append(readLine);
            }
            in.close();
            // print result
            System.out.println(response.toString());

            return response.toString();
            //GetAndPost.POSTRequest(response.toString());        
        } else {
            System.out.println("GET NOT WORKED");
        }
        }
        return null;
    }

    public static void MyPOSTRequest() throws IOException {
        final String POST_PARAMS = "{\"finish\":false,\"player1\":\"Love\",\"player2\":\"Love\",\"deuce\":false,\"setScore\":{\"player1\":0,\"player2\":0}}";

        System.out.println(POST_PARAMS);
        URL obj = new URL("https://tennis-score-api.herokuapp.com/score");
        HttpURLConnection postConnection = (HttpURLConnection) obj.openConnection();
        postConnection.setRequestMethod("POST");

        postConnection.setRequestProperty("Content-Type", "application/json");
        postConnection.setDoOutput(true);
        OutputStream os = postConnection.getOutputStream();
        os.write(POST_PARAMS.getBytes());
        os.flush();
        os.close();
        int responseCode = postConnection.getResponseCode();
        System.out.println("POST Response Code :  " + responseCode);
        System.out.println("POST Response Message : " + postConnection.getResponseMessage());
        if (responseCode == HttpURLConnection.HTTP_OK) { //success
            BufferedReader in = new BufferedReader(new InputStreamReader(
                    postConnection.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            // print result
            System.out.println(response.toString());

        } else {
            System.out.println("POST NOT WORKED");
        }
    }

}
