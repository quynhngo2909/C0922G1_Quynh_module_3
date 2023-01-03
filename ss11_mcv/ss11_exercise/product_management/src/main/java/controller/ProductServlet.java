package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

@WebServlet(name = "productServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    private static IProductService productService = new ProductService();
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                showProductList(request, response);
                break;
            case "create":
                showCreationForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                showDeleteProduct(request, response);
                break;
            case "view":
                showProductInformation(request, response);
                break;
            default:
                showProductList(request, response);
                break;
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                searchProductByName(request, response);
                break;
            default:
                showProductList(request, response);
                break;
        }
    }

    private void showProductList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.list();
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher;
        if(productList.size() == 0) {
            request.setAttribute("message", "The product list is empty");
        } else {
            request.setAttribute("productList", productList);
        }

        dispatcher = request.getRequestDispatcher("view/product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreationForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        productService.save(new Product(name, price, description, producer));
        request.setAttribute("message", "New product was created.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher dispatcher;
        if(product == null) {
            dispatcher = request.getRequestDispatcher("view/product/error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("view/product/update.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        productService.save(new Product(id, name, price, description, producer));
        request.setAttribute("message", "Product was updated.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/update.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void  showProductInformation(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher dispatcher;
        if(product == null) {
            dispatcher = request.getRequestDispatcher("view/error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("view/product/view.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void showDeleteProduct(HttpServletRequest request,HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher dispatcher;
        if(product == null) {
            dispatcher = request.getRequestDispatcher("view/error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("view/product/delete.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher dispatcher;
        if(product == null) {
            dispatcher = request.getRequestDispatcher("view/error-404.jsp");
        } else {
           productService.delete(id);
           request.setAttribute("message", "The product was deleted.");
            dispatcher = request.getRequestDispatcher("view/product/delete.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    private void searchProductByName(HttpServletRequest request, HttpServletResponse response) {
        String productName = request.getParameter("search");
        List<Product> productList = productService.searchByName(productName);
        RequestDispatcher dispatcher;
        if(productList.size() == 0) {
            request.setAttribute("message", "Product name" + productName + " is not exist.");
        } else {
            request.setAttribute("productList", productList);
        }
        dispatcher = request.getRequestDispatcher("view/product/search.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
