import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Discount" ,value = "/display_discount")
public class DisplayDiscount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int price= Integer.parseInt(req.getParameter("price"));
        int discount= Integer.parseInt(req.getParameter("discount"));
        String info= req.getParameter("info");
        double ammount=0;
        double discountPrice= 0;
        PrintWriter writer=resp.getWriter();
        writer.println("<html>");
        writer.println("Product Description "+ info);
        writer.println("<br>");
        writer.println("List Price: " + price);
        writer.println("Discount Amount: " + (price * discount * 0.1));
        writer.println("Discount Price: " + (price-price * discount * 0.1));
        writer.println("</html>");
    }
}
