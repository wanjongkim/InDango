/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package timers;

import daos.MovieDAO;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import models.Genre;
import models.Movie;
import models.PlayingMovie;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author Shawn
 */
@Singleton
public class MovieTimer {

    @EJB
    MovieDAO mDAO;
    private int pageIndex = 1000; 
    private final String key = "318fa165649de5b30b74568e44512dce";
    
    @Schedule(dayOfWeek = "*", month = "*", hour = "*", dayOfMonth = "*", year = "*", minute = "*", second = "1", persistent = false)
    public void myTimer() {
        retrieveMovieInfoFromServer();
    }

    private void retrieveMovieInfoFromServer() {
        JSONParser parser = new JSONParser();
        try {
            String urlForMovies = "https://api.themoviedb.org/3/discover/movie?api_key=" + key + "&language=en-US&sort_by=release_date.desc&include_adult=false&include_video=true&page=" + pageIndex;
            URL u = new URL(urlForMovies);
            HttpURLConnection con = (HttpURLConnection) u.openConnection();
            con.setRequestMethod("GET");
            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String movieInfo = br.readLine();
            JSONObject entireJSON = (JSONObject) parser.parse(movieInfo);
            JSONArray results = (JSONArray) entireJSON.get("results");
            con.disconnect();
            br.close();
            for(int i=0; i<results.size(); i++) {
                JSONObject singleMovie = (JSONObject) results.get(i);
                String movieID = singleMovie.get("id").toString();
                String urlForMovieDetails = "https://api.themoviedb.org/3/movie/"+movieID+"?api_key="+key+"&append_to_response=videos,images";
                URL u2 = new URL(urlForMovieDetails);
                HttpURLConnection con2 = (HttpURLConnection) u2.openConnection();
                con2.setRequestMethod("GET");
                BufferedReader br2 = new BufferedReader(new InputStreamReader(con2.getInputStream()));
                String movieInfo2 = br2.readLine();
                JSONObject entireJSON2 = (JSONObject) parser.parse(movieInfo2);
                String homepage = "";
                String imdbID = "";
                String title = "";
                String releaseDate = "";
                String runtime = "";
                String status = "";
                String overview = "";
                String posterPath = "";
                if(entireJSON2.get("homepage") != null)
                    homepage = entireJSON2.get("homepage").toString();
                if(entireJSON2.get("imdb_id") != null)
                    imdbID = entireJSON2.get("imdb_id").toString();
                if(entireJSON2.get("title") != null)
                    title = entireJSON2.get("title").toString();
                if(entireJSON2.get("release_date") != null)
                    releaseDate = entireJSON2.get("release_date").toString();
                if(entireJSON2.get("poster_path") != null) {
                    posterPath = entireJSON2.get("poster_path").toString();
                }
                if(entireJSON2.get("runtime") != null)
                    runtime = entireJSON2.get("runtime").toString();
                if(entireJSON2.get("status") != null)
                    status = entireJSON2.get("status").toString();
                if(entireJSON2.get("overview") != null)
                    overview = entireJSON2.get("overview").toString();
                if(title == null || title.equalsIgnoreCase("")) {
                    title = "null";
                }
                if(releaseDate == null || releaseDate.equalsIgnoreCase("")) {
                    releaseDate = "TBD";
                }
                if(runtime == null || runtime.equalsIgnoreCase("")) {
                    runtime = "unknown";
                }
                if(homepage == null || homepage.equalsIgnoreCase("")) {
                    homepage = "none";
                }
                if(posterPath == null || posterPath.equalsIgnoreCase("")) {
                    posterPath = "none";
                }
                if(imdbID == null || imdbID.equalsIgnoreCase("")) {
                    imdbID = "none";
                }
                if(status == null || status.equalsIgnoreCase("")) {
                    status = "TBD";
                }
                if(overview == null || overview.equalsIgnoreCase("")) {
                    overview = "unknown";
                }
                JSONObject videos = (JSONObject) entireJSON2.get("videos");
                JSONArray videoResults = (JSONArray) videos.get("results");
                List<String> l2 = new ArrayList();
                for(int j=0; j<videoResults.size(); j++) {
                    JSONObject o = (JSONObject) videoResults.get(j);
                    if(o.get("key")!=null) {
                        String videoKey = o.get("key").toString();
                        l2.add(videoKey);
                    }
                }
                String trailer = "";
                if(l2.size() >= 1) {
                    trailer = l2.get(0);
                }
                else {
                    trailer = "none";
                }
                Movie pm = new Movie(title, "0", releaseDate, runtime, overview, homepage, posterPath, imdbID, status, 0, trailer);
                
                Genre ge = new Genre(9, "fantasy");
                pm.setGenre(ge);
                mDAO.create(pm);
                con2.disconnect();
                br2.close();
            }
            pageIndex--;
        } catch(Exception ex) {
            System.out.println(ex);
        }
    }
}
