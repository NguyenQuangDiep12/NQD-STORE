package com.laptop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.laptop.model.Product;
import com.laptop.services.IProductService;
import com.laptop.services.utils.UploadService;

@Controller
@RequestMapping("${admin.api.prefix}")
public class AdminController {

    private IProductService iProductService;
    private UploadService uploadService;

    public AdminController(IProductService iProductService, UploadService uploadService) {
        this.iProductService = iProductService;
        this.uploadService = uploadService;
    }

    @GetMapping({ "", "/dashboard" })
    public String dashboard() {
        return "admin/dashboard";
    }

    @GetMapping({ "/edit-product" })
    public String getProductPage(@RequestParam(value = "name", required = false) String name, Model model) {
        model.addAttribute("product", new Product());
        List<Product> products = this.iProductService.getAllProduct();
        model.addAttribute("existProduct", products);

        if (name != null && !name.trim().isEmpty()) {
            List<Product> filterProducts = this.iProductService.getProductByName(name);
            model.addAttribute("filterProducts", filterProducts);
        }

        return "admin/edit-product";
    }

    @GetMapping("/edit-product-search")
    @ResponseBody
    public String searchProduct(@RequestParam(value = "name", required = false) String name, Model model) {
        // loc theo ten san pham neu co
        List<Product> filteProducts = this.iProductService.getProductByName(name);

        // tra ve mot phan tu html chua cac san pham tim thay
        StringBuilder html = new StringBuilder();
        for (Product product : filteProducts) {
            html.append("<tr class=\"row ms-0 me-0\">")
                    .append("<td class=\"col-sm-4\">").append(product.getName()).append("</td>")
                    .append("<td class=\"col-sm-4\">").append(product.getPrice()).append("</td>")
                    .append("<td class=\"col-sm-4\"><img src=\"/webapp/static/image/product/")
                    .append(product.getImage()).append("\" alt=\"")
                    .append(product.getName()).append("\" style=\"width: 50px; height: 50px;\"></td>")
                    .append("</tr>");
        }
        if (filteProducts.isEmpty()) {
            html.append("<tr><td colspan=\"3\" class=\"text-center\">No products found</td></tr>");
        }

        return html.toString();
    }

    @PostMapping({ "/add-new-product" })
    public String submitFormProduct(@ModelAttribute("product") Product product, BindingResult result,
            @RequestParam("imageFile") MultipartFile file) {
        // validate
        if (result.hasErrors()) {
            return "admin/edit-product";
        }

        String productFile = this.uploadService.handleSaveUploadFile(file, "product");
        product.setImage(productFile);
        iProductService.addProduct(product);
        return "redirect:/admin/edit-product";

    }

    @PostMapping({ "/update-product/{productId}" })
    public String updateProduct(@ModelAttribute("product") Product product, BindingResult result,
            @RequestParam(value = "imageFile", required = false) MultipartFile file,
            @PathVariable("productId") Long productId) {
        // validate
        if (result.hasErrors()) {
            return "admin/edit-product";
        }

        Product existProduct = this.iProductService.updateProduct(productId);

        // Kiểm tra nếu có file ảnh được tải lên
        if (file != null && !file.isEmpty()) {
            String productFile = this.uploadService.handleSaveUploadFile(file, "product");
            product.setImage(productFile);
        } else {
            // Giữ lại ảnh cũ nếu không có file mới được tải lên
            product.setImage(existProduct.getImage());
        }

        if (product != null) {
            existProduct.setName(product.getName());
            existProduct.setPrice(product.getPrice());
            existProduct.setImage(product.getImage());
            existProduct.setDescription(product.getDescription());
            existProduct.setQuantity(product.getQuantity());
            existProduct.setInventory(product.getInventory());
        }

        // luu san pham da cap nhat
        this.iProductService.addProduct(existProduct);

        return "redirect:/admin/edit-product";

    }

    @PostMapping({ "/delete-product/{productId}" })
    public String deleteProduct(
            @ModelAttribute("product") Product product,
            BindingResult result,
            @PathVariable("productId") Long productId) {
        // validate
        if (result.hasErrors()) {
            return "admin/edit-product";
        }

        this.iProductService.deleteProduct(productId);

        return "redirect:/admin/edit-product";
    }

    @GetMapping({ "/cards" })
    public String getCards() {
        return "admin/cards";
    }

    @GetMapping({ "/utilities-color" })
    public String getColors() {
        return "admin/utilities-color";
    }

    @GetMapping({ "/utilities-border" })
    public String getBorders() {
        return "admin/utilities-border";
    }

    @GetMapping({ "/utilities-animation" })
    public String getAnimations() {
        return "admin/utilities-animation";
    }

    @GetMapping({ "/utilities-other" })
    public String getOther() {
        return "admin/utilities-other";
    }
}
