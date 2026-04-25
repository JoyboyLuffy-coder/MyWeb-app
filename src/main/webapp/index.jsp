<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>NexusShop — Modern UI</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --bg:#f8fafc;
    --primary:#0f172a;
    --accent:#3b82f6;
    --muted:#64748b;
    --card:#ffffff;
    --surface:#eef2f7;
}

body{
    margin:0;
    font-family:Inter;
    background:var(--bg);
    color:var(--primary);
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
    background:rgba(255,255,255,0.9);
    backdrop-filter:blur(10px);
    border-bottom:1px solid #eee;
}

.header-inner{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:14px 0;
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
    margin:0 12px;
    text-decoration:none;
    color:var(--primary);
}

nav a:hover{
    color:var(--accent);
}

/* SEARCH */
.search{
    background:var(--surface);
    padding:10px 14px;
    border-radius:999px;
}

.search input{
    border:none;
    outline:none;
    background:transparent;
}

/* HERO */
.hero{
    background:linear-gradient(120deg,#0f172a,#1e293b);
    color:white;
    text-align:center;
    padding:80px 20px;
}

.hero h1{
    font-size:44px;
}

.hero p{
    max-width:700px;
    margin:auto;
}

/* BUTTON */
.btn{
    padding:12px 22px;
    border:none;
    border-radius:999px;
    cursor:pointer;
    margin-top:12px;
}

.btn-primary{
    background:var(--accent);
    color:white;
}

.btn-primary:hover{
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
    background:white;
    border-radius:14px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.05);
    transition:0.25s;
}

.product:hover{
    transform:translateY(-8px);
    box-shadow:0 20px 40px rgba(0,0,0,0.08);
}

.product img{
    width:100%;
    height:200px;
    object-fit:cover;
}

.product-body{
    padding:14px;
}

.price{
    font-weight:700;
}

/* FOOTER */
footer{
    text-align:center;
    padding:30px;
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
<a href="#">Products</a>
<a href="#">Deals</a>
</nav>

<div class="search">
<input type="text" id="searchInput" placeholder="Search products...">
</div>
</div>
</header>

<section class="hero">
<h1>Premium Picks for You</h1>
<p>Discover the latest trends in fashion, technology, and accessories — carefully curated for you.</p>
<button class="btn btn-primary">Shop Now</button>
</section>

<section class="container" style="padding:50px 0;">
<h2>Trending Products</h2>

<div class="grid products" id="productsGrid"></div>
</section>

<footer>
© 2026 NexusShop. All rights reserved.
</footer>

<script>
const PRODUCTS = [
{title:"iPhone 14 Pro",price:1099,img:"https://images.unsplash.com/photo-1601784551446"},
{title:"MacBook Pro",price:1999,img:"https://images.unsplash.com/photo-1593642632823"},
{title:"Sony Headphones",price:399,img:"https://images.unsplash.com/photo-1600185365483"}
];

const grid=document.getElementById("productsGrid");
const search=document.getElementById("searchInput");

function render(list){
    if(list.length===0){
        grid.innerHTML="<p>No products found</p>";
        return;
    }

    grid.innerHTML="";
    list.forEach(p=>{
        grid.innerHTML+=`
        <div class="product">
            <img src="${p.img}" alt="">
            <div class="product-body">
                <h4>${p.title}</h4>
                <div class="price">$${p.price}</div>
                <button class="btn btn-primary">Add to Cart</button>
            </div>
        </div>`;
    });
}

search.addEventListener("input",()=>{
    const q=search.value.toLowerCase();
    render(PRODUCTS.filter(p=>p.title.toLowerCase().includes(q)));
});

render(PRODUCTS);
</script>

</body>
</html>
