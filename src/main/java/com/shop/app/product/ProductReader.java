package com.shop.app.product;

import com.shop.app.product.model.Product;
import java.io.FileReader;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;

public class ProductReader implements Serializable {

    public List<Product> readProduct(String path) {
        try (Scanner scanner = new Scanner(new FileReader(path))) {
            List<Product> products = new ArrayList<>();
            while(scanner.hasNext()){
                String line = scanner.nextLine();
                StringTokenizer tokenizer = new StringTokenizer(line, ";");
                int id = Integer.parseInt(tokenizer.nextToken());
                String name = tokenizer.nextToken();
                BigDecimal price = new BigDecimal(tokenizer.nextToken());
                Product product = new Product(id, name, price);
                products.add(product);
            }
            return products;
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
}
