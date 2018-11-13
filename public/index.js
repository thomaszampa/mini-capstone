/* global axios */

axios.get("/api/products").then(function(response) {
  var products = response.data;
  console.log("These products are", products);

  var productTemplate = document.querySelector("#product-card");
  var productContainer = document.querySelector(".row");

  products.forEach(function(product) {
    var copiedProduct = productTemplate.content.cloneNode(true);

    copiedProduct.querySelector(".card-img-top").src = product.images[0];
    copiedProduct.querySelector(".card-title").innerText = product.name;
    copiedProduct.querySelector(".card-price").innerText = "$" + product.price;
    copiedProduct.querySelector(".card-text").innerText = product.description;
    productContainer.appendChild(copiedProduct);
  });
});
