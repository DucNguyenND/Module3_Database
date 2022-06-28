import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TranslationServlet" , value = "/translate")
public class Dictionary extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("txtSearch");
        Map<String,String> dictionary=new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển vở");
        dictionary.put("computer", "Máy tính");
        PrintWriter printWriter=resp.getWriter();
        printWriter.println("<html>");

        String result = dictionary.get(search);
        if(result != null){
            printWriter.println("Word: " + search);
            printWriter.println("Result: " + result);
        } else {
            printWriter.println("Not found");
        }

        printWriter.println("</html>");
    }

}
