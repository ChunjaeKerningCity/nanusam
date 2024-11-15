package net.fullstack7.nanusam.util;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
@Log4j2
@Component
public class RestUtil {
    public String getAsynchroMsg(String uri) throws MalformedURLException {
        URL url = new URL("http://localhost:8080"+uri);
        StringBuilder sb = new StringBuilder();
        BufferedReader br = null;
        try {
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            //Request Header 정의
            con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            //전송방식
            con.setRequestMethod("GET");
            //서버에 연결되는 Timeout 시간 설정
            con.setConnectTimeout(5000);
            //InputStream 읽어 오는 Timeout 시간 설정
            con.setReadTimeout(5000);
            // URL 연결은 입출력으로 사용 가능
            // URLConnection 의 doOutput 필드값 설정
            // DoOutFlag
            //   - 출력용 : true
            //   - 기본값 : false
            con.setDoOutput(false);
            if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
                String line;
                while ((line = br.readLine()) != null) {
                    sb.append(line);
                }
                br.close();
                return sb.toString();

            } else {
                log.info("error : "+con.getResponseCode());
                return "error";
            }
        } catch (Exception e) {
            log.info(e.getMessage());
            return "error";
        }
    }
}
