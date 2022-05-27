import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscountCalcutorServlet" ,urlPatterns = "/calculator")
public class ProductDiscountCalcutorServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
            String description=request.getParameter("description");
            float price=Float.parseFloat(request.getParameter("price"));
            int discountPerson=Integer.parseInt(request.getParameter("discount"));
            float discount=(float)(price * discountPerson*0.01);
            float total=price-discount;
        PrintWriter printWriter=response.getWriter();
        printWriter.println("<html>");
        printWriter.println("<h1> product description" +description);
        printWriter.println("<h1> product price"+price);
        printWriter.println("<h1> product discount person" +discountPerson);
        printWriter.println("<h1> product discount" +discount);
        printWriter.println("<h1> product total" +total);
        printWriter.println("<html>");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
