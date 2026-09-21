package Methods;

import java.io.OutputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class OfficePlatformResolver {

    private static final String DEFAULT_SERVER = "http://localhost:8080";
    private static final String DEFAULT_API_KEY = "opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0";

    // Base del microservicio Office Platform resuelta en runtime: -D system property -> env var ->
    // fallback localhost. Se le anexa /api/auth/resolve donde se consume.
    private static String resolveServerBase() {
        String v = System.getProperty("OFFICE_PLATFORM_URL");
        if (v == null || v.trim().isEmpty()) {
            v = System.getenv("OFFICE_PLATFORM_URL");
        }
        if (v == null || v.trim().isEmpty()) {
            v = DEFAULT_SERVER;
        }
        v = v.trim();
        while (v.endsWith("/")) {
            v = v.substring(0, v.length() - 1);
        }
        return v;
    }

    // API-key resuelta en runtime: -D system property -> env var -> fallback embebido.
    private static String resolveApiKey() {
        String v = System.getProperty("OFFICE_PLATFORM_API_KEY");
        if (v == null || v.trim().isEmpty()) {
            v = System.getenv("OFFICE_PLATFORM_API_KEY");
        }
        if (v == null || v.trim().isEmpty()) {
            v = DEFAULT_API_KEY;
        }
        return v.trim();
    }

    public static String resolveToken(String cedula, String nombre) {
        try {
            if (cedula == null || cedula.trim().isEmpty()) {
                cedula = "12345678";
            }
            String digits = cedula.replaceAll("[^0-9]", "");
            if (digits.length() < 5) {
                int num = digits.isEmpty() ? 1 : Integer.parseInt(digits);
                digits = String.format("%05d", num + 10000);
            } else if (digits.length() > 11) {
                digits = digits.substring(0, 11);
            }
            cedula = digits;
            
            if (nombre == null || nombre.trim().isEmpty()) {
                nombre = "Usuario";
            }
            
            URL url = new URL(resolveServerBase() + "/api/auth/resolve");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; utf-8");
            conn.setRequestProperty("Accept", "application/json");
            conn.setDoOutput(true);
            
            // Escapar comillas en los inputs
            String escapedNombre = nombre.replace("\"", "\\\"");
            String escapedCedula = cedula.replace("\"", "\\\"");
            
            String jsonInputString = "{"
                    + "\"cedula\":\"" + escapedCedula + "\","
                    + "\"nombre\":\"" + escapedNombre + "\","
                    + "\"apiKey\":\"" + resolveApiKey() + "\""
                    + "}";
            
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }
            
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK || responseCode == HttpURLConnection.HTTP_CREATED) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    
                    // Extraer "widgetToken" del JSON retornado
                    String respStr = response.toString();
                    int tokenIndex = respStr.indexOf("\"widgetToken\":\"");
                    if (tokenIndex != -1) {
                        int start = tokenIndex + "\"widgetToken\":\"".length();
                        int end = respStr.indexOf("\"", start);
                        if (end != -1) {
                            return respStr.substring(start, end);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
}
