<%-- 
    Document   : shoppingCart
    Created on : 28. maj 2021., 19:05:25
    Author     : Grupa1
--%>

<%@page import="java.util.List"%>
<%@page import="com.shop.app.product.model.Product"%>
<%@page import="com.shop.app.cart.ShoppingCart"%>
<%@page import="com.shop.app.cart.ShoppingCartItem"%>
<%@page import="com.shop.app.product.ProductReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! ProductReader productReader = new ProductReader();%>
<%!

    public Product findById(int productId, String path) {
        List<Product> products = productReader.readProduct(path);
        for (Product product : products) {
            if (product.getId() == productId) {
                return product;
            }
        }
        return null;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proizvodi u korpi</title>
        <style>
            th{
                background-color: tomato;
                color: white;
            }

            table,th,td {
                padding: 10px;
                border: 1px solid tomato;
                border-collapse: collapse;
            }
        </style>
    </head>
    <body>
        <%
            ShoppingCart cart = (ShoppingCart) session.getAttribute("korpa");
            if (cart == null) {
                cart = new ShoppingCart();
                session.setAttribute("korpa", cart);
            }
            int productId = Integer.parseInt(request.getParameter("productId"));
            String path = application.getRealPath("products.txt");
            Product product = findById(productId, path);
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            cart.addItem(product, quantity);
        %>
        <h1>Sadržaj korpe</h1>
        <table>
            <tr>
                <th>Naziv</th>
                <th>Jedinična cijena</th>
                <th>Količina</th>
                <th>Ukupna cijena</th>
            </tr>
            <%
                for (ShoppingCartItem item : cart.getShoppingCartItems()) {
            %>
            <tr>
                <td><%=item.getProduct().getName()%></td>
                <td><%=item.getProduct().getUnitPrice().toPlainString()%></td>
                <td><%=item.getQuantiy()%></td>
                <td><%=item.getTotalPrice().toPlainString()%></td>
            </tr>
            <%}%>

        </table>
    </body>
</html>
