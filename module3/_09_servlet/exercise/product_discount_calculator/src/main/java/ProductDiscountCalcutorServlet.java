import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscountCalcutorServlet" ,urlPatterns = "/calculator")
public class ProductDiscountCalcutorServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String description;
        float price;
        int discountPerson;
        float discount;
        float total;
        try {
            description  =request.getParameter("description");

            price=Float.parseFloat(request.getParameter("price"));
            discountPerson =Integer.parseInt(request.getParameter("discount"));
            discount =(float)(price * discountPerson*0.01);
            total  =price-discount;

        PrintWriter printWriter=response.getWriter();
        printWriter.println("<html>");
        printWriter.println("<h1> product description" +description);
        printWriter.println("<h1> product price"+price);
        printWriter.println("<h1> product discount person" +discountPerson);
        printWriter.println("<h1> product discount" +discount);
        printWriter.println("<h1> product total" +total);
        printWriter.println("<html>");
        }catch (NumberFormatException e)
        {
            System.out.println("wrong format");
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
