import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "login", value = "/login")
public class Loginaccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName= req.getParameter("username");
        String password= req.getParameter("password");
        PrintWriter writer= resp.getWriter();
        writer.println("<html>");
        if (userName.equals("admin")&& password.equals("admin")) {
            writer.println("<h1> Welcome "+ userName + "</h1>");
        } else
            writer.println("<h1>Login Error</h1>");
        writer.println("</html>");
        }
    }
