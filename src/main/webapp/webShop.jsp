<%@page import="com.shop.app.product.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.app.product.ProductReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!ProductReader productReader = new ProductReader();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web shop</title>
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
        <h1>Raspoloživi proizvodi</h1>
        <table>
            <tr><th>Naziv</th><th>Cijena</th><th>Dodaj u korpu</th></tr>
                    <%
                        String path = application.getRealPath("products.txt");
                        List<Product> products = productReader.readProduct(path);
                        for (Product product : products) {%>
            <tr>
                <td><%=product.getName()%></td>
                <td><%=product.getUnitPrice().toPlainString()%></td>
                <td>
                    <form action="cart/shoppingCart.jsp" method="GET">
                        <input type="number" name="quantity" size="3"/>
                        <input type="hidden" name="productId" value="<%=product.getId()%>"/>
                        <input type="submit" value="Dodaj"/>
                    </form>
                </td>
            </tr>
            <%}%>

        </table>
    </body>
</html>
