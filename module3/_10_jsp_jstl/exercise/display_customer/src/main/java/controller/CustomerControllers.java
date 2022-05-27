package controller;

import model.Customer;

import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "CustomerServlet", urlPatterns ="/CustomerList")
public class CustomerControllers extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Customer[] customerList=new Customer[5];
        customerList[0]=new Customer("hoang hao","08/07/1999" ,"da nang","https://static.wikia.nocookie.net/doraemon/images/b/b8/Doraemon_2005.PNG/revision/latest?cb=20151207094313&path-prefix=en");
        customerList[1]=new Customer("thao uyen","12/07/1995" ,"da nang","https://tapchitintuc24h.com/wp-content/uploads/2021/08/V%E1%BB%8Bt-v%C3%A0ng-b%E1%BB%91i-r%E1%BB%91i-30.jpg");
        customerList[2]=new Customer("duy trung","23/08/2001" ,"da nang","https://quantri.longbien.edu.vn//UploadFolderNew/SGDLongBien/Image/mnngocthuy/2021_10_image/47_22102021.jpg?w=1130");
        customerList[3]=new Customer("manh cuong","14/10/2002" ,"da nang","https://i.pinimg.com/550x/c0/6c/e2/c06ce2f49b1f4596db9e214d4b9e755a.jpg");
        customerList[4]=new Customer("luu hoa","10/10/1996" ,"da nang","https://upanh123.com/wp-content/uploads/2020/11/anh-tho-chibi.0.jpg");
        request.setAttribute("customer", customerList);
        request.getRequestDispatcher("customer.jsp").forward(request,response);

    }
}
