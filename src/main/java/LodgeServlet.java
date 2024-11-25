import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.MoffatBayLodge.beans.Authentication;
import com.MoffatBayLodge.model.CustomerOps;
import com.MoffatBayLodge.model.DBManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;
import java.util.Properties;

@WebServlet(name = "LodgeServlet", urlPatterns = {"/lodge"}) //**Change for final project**
public class LodgeServlet extends HttpServlet implements Servlet {

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        System.out.println("Initialization Lodge Servlet");

        /**
         * Credentials for DB connection are stored in DBManager class
         * May want to create setter/getter and set values here instead
         */
        DBManager dbManager = new DBManager();
        ServletContext servletContext = config.getServletContext();
        servletContext.setAttribute("dbManager", dbManager);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Database driver loaded");
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found");
        }

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DBManager dbManager = new DBManager();

       // dbManager.checkRegistration(request, response);

        String action = request.getParameter("action");
        switch (action){
            case "register":
                dbManager.checkRegistration(request, response);
                break;
            case "login":
                dbManager.checkLogin(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }

    }
}