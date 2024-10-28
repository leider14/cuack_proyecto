package Controlador;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PagoServlet")
public class PagoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "init";
        
        switch (action) {
            case "init":
                initPayment(request, response);
                break;
            case "getResult":
                getResult(request, response);
                break;
            default:
                response.getWriter().write("Acción no reconocida.");
                break;
        }
    }

    private void initPayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int amount = Integer.parseInt(request.getParameter("amount"));
        if (amount <= 0) {
            response.getWriter().write("Monto inválido.");
            return;
        }

        int buyOrder = new Random().nextInt(1000000);
        int sessionId = new Random().nextInt(1000000);
        String returnUrl = request.getRequestURL() + "?action=getResult";

        String data = String.format("{\"buy_order\": \"%d\", \"session_id\": \"%d\", \"amount\": %d, \"return_url\": \"%s\"}",
                buyOrder, sessionId, amount, returnUrl);
        
        String endpoint = "/rswebpaytransaction/api/webpay/v1.0/transactions";
        String responseFromApi = getWs(data, "POST", endpoint);

        request.setAttribute("response", responseFromApi);
        request.getRequestDispatcher("pago.jsp").forward(request, response);
    }

    private void getResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token_ws");
        if (token == null || token.isEmpty()) {
            response.getWriter().write("Token no recibido.");
            return;
        }

        String endpoint = "/rswebpaytransaction/api/webpay/v1.0/transactions/" + token;
        String responseFromApi = getWs("", "PUT", endpoint);

        request.setAttribute("response", responseFromApi);
        request.getRequestDispatcher("resultado.jsp").forward(request, response);
    }

    private String getWs(String data, String method, String endpoint) throws IOException {
        String tbkApiKeyId = "597055555532";
        String tbkApiKeySecret = "579B532A7440BB0C9079DED94D31EA1615BACEB56610332264630D42D0A36B1C";
        String urlStr = "https://webpay3gint.transbank.cl" + endpoint; // Testing URL
        
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod(method);
        conn.setRequestProperty("Tbk-Api-Key-Id", tbkApiKeyId);
        conn.setRequestProperty("Tbk-Api-Key-Secret", tbkApiKeySecret);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        if (!data.isEmpty()) {
            conn.getOutputStream().write(data.getBytes("UTF-8"));
        }

        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (java.util.Scanner s = new java.util.Scanner(conn.getInputStream()).useDelimiter("\\A")) {
                return s.hasNext() ? s.next() : "";
            }
        } else {
            return "Error: " + responseCode;
        }
    }
}
