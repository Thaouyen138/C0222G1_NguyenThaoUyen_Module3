package controller;

import model.Products;
import services.ProductImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "ProductServlet" ,urlPatterns = "/product")
public class ProductServlet extends javax.servlet.http.HttpServlet {
    private ProductImpl productService =new ProductImpl();
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);

                break;
            default:
                listProduct(request,response);
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Products customer = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if(customer == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.productService.remove(id);
            try {
                response.sendRedirect("/customers");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        //id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất.

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describle = request.getParameter("describle");
        String produce = request.getParameter("produce");
        Products products = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if(products == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            products.setName(name);
            products.setPrice(price);
            products.setDescrible(describle);
            products.setProduce(produce);
            this.productService.update(id, products);
            request.setAttribute("product", products);
            request.setAttribute("message", "product information was updated");
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        //id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất.
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price")) ;
        String describle = request.getParameter("describle");
        String produce = request.getParameter("produce");
        int id = (int)(Math.random() * 10000);

        Products pro = new Products(id, name, price, describle,produce);
        this.productService.save(pro);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        request.setAttribute("message", "New product was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);

                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Products> products = this.productService.findAll();
        request.setAttribute("product", products);

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void viewProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Products products = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if(products == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", products);
            dispatcher = request.getRequestDispatcher("product/view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Products products = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if(products == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", products);
            dispatcher = request.getRequestDispatcher("product/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Products products = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if(products == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", products);
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

