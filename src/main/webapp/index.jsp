<%@ page import="java.util.*" %>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NexusShop</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">

<style>
:root{
    --primary:#0a2540;
    --accent:#00d4ff;
    --muted:#6b7280;
    --surface:#f1f5f9;
}

body{
    margin:0;
    font-family:Inter;
    color:var(--primary);
    background:#fff;
    line-height:1.6;
}

.container{
    max-width:1200px;
    margin:auto;
    padding:0 20px;
}

/* HEADER */
header{
    position:sticky;
    top:0;
    background:#fff;
    border-bottom:1px solid #eee;
}

.header-inner{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:12px 0;
}

.brand{
    font-family:Poppins;
    font-size:22px;
    font-weight:700;
}

.brand span{
    color:var(--accent);
}

nav a{
    margin:0 10px;
    text-decoration:none;
    color:var(--primary);
}

nav a:hover{
    color:var(--accent);
}

/* SEARCH */
.search{
    background:var(--surface);
    padding:8px 12px;
    border-radius:999px;
}

.search input{
    border:none;
    outline:none;
    background:transparent;
}

/* HERO */
.hero{
    background:#0a2540;
    color:white;
    text-align:center;
    padding:60px 20px;
}

.hero h1{
    font-size:40px;
}

.btn{
    padding:10px 18px;
    border:none;
    border-radius:999px;
    cursor:pointer;
    margin-top:10px;
}

.btn-primary{
    background:var(--accent);
}

.btn:hover{
    transform:translateY(-2px);
}

/* PRODUCTS */
.grid{
    display:grid;
    gap:20px;
}

.products{
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
}

.product{
    background:#fff;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 10px 20px rgba(0,0,0,0.05);
    transition:0.2s;
}

.product:hover{
    transform:translateY(-5px);
}

.product img{
    width:100%;
    height:200px;
    object-fit:cover;
}

.product-body{
    padding:12px;
}

.price{
    font-weight:700;
}

/* FOOTER */
footer{
    text-align:center;
    padding:20px;
    color:var(--muted);
}
</style>

</head>

<body>

<header>
<div class="container header-inner">
<div class="brand">Nexus<span>Shop</span></div>

<nav>
<a href="#">Home</a>
<a href="#">Categories</a>
<a href="#">Deals</a>
</nav>

<div class="search">
<input type="text" id="searchInput" placeholder="Search products...">
</div>
</div>
</header>

<!-- HERO -->

<section class="hero">
<h1>Premium Picks for You</h1>
<p>Discover the latest trends in fashion, technology, and accessories — carefully curated for you.</p>
<button class="btn btn-primary">Shop Now</button>
</section>

<!-- PRODUCTS -->

<section class="container" style="padding:40px 0;">
<h2>Trending Products</h2>

<div class="grid products">

<%
class Product {
int id;
String title;
double price;
String img;

```
Product(int id, String title, double price, String img){
    this.id = id;
    this.title = title;
    this.price = price;
    this.img = img;
}
```

}

List<Product> products = new ArrayList<>();

products.add(new Product(1,"iPhone 14 Pro",1099,"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb"));
products.add(new Product(2,"MacBook Pro",1999,"https://images.unsplash.com/photo-1593642632823"));
products.add(new Product(3,"Sony Headphones",399,"https://images.unsplash.com/photo-1600185365483"));

for(Product p : products){
%>

<div class="product">
    <img src="<%= p.img %>" alt="<%= p.title %>">
    <div class="product-body">
        <h4><%= p.title %></h4>
        <div class="price">$<%= p.price %></div>
        <button class="btn btn-primary">Add to Cart</button>
    </div>
</div>

<%
}
%>

</div>
</section>

<footer>
© <%= Calendar.getInstance().get(Calendar.YEAR) %> NexusShop. All rights reserved.
</footer>

<script>
// search functionality
const search = document.getElementById("searchInput");

search.addEventListener("input", function(){
    const value = this.value.toLowerCase();
    const products = document.querySelectorAll(".product");

    products.forEach(p=>{
        const text = p.innerText.toLowerCase();
        p.style.display = text.includes(value) ? "block" : "none";
    });
});
</script>

</body>
</html>

