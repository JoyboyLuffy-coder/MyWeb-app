<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>NexusShop — Premium Commerce</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">
  <style>
    :root {
      --ink: #0d0d0d;
      --paper: #faf8f4;
      --cream: #f2ede4;
      --gold: #c9a84c;
      --gold-light: #e8d5a3;
      --blush: #e8d5c4;
      --charcoal: #2a2a2a;
      --smoke: #6b6560;
      --white: #ffffff;
      --radius-sm: 6px;
      --radius-md: 14px;
      --radius-lg: 24px;
      --shadow-sm: 0 2px 12px rgba(0,0,0,0.06);
      --shadow-md: 0 8px 32px rgba(0,0,0,0.10);
      --shadow-lg: 0 20px 60px rgba(0,0,0,0.14);
    }
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }
    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--paper);
      color: var(--ink);
      -webkit-font-smoothing: antialiased;
      overflow-x: hidden;
    }
    a { text-decoration: none; color: inherit; }

    /* ── NOISE TEXTURE OVERLAY ── */
    body::before {
      content: '';
      position: fixed; inset: 0; pointer-events: none; z-index: 999;
      opacity: 0.025;
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='300' height='300'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='300' height='300' filter='url(%23n)' opacity='1'/%3E%3C/svg%3E");
    }

    /* ── HEADER ── */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(250, 248, 244, 0.92);
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      border-bottom: 1px solid rgba(201,168,76,0.15);
    }
    .header-inner {
      max-width: 1280px; margin: 0 auto;
      padding: 0 32px;
      display: flex; align-items: center; justify-content: space-between;
      height: 72px; gap: 20px;
    }
    .brand {
      font-family: 'Playfair Display', serif;
      font-size: 22px; font-weight: 900;
      letter-spacing: -0.03em; white-space: nowrap;
    }
    .brand .dot { color: var(--gold); }
    .main-nav ul {
      display: flex; gap: 4px; list-style: none; align-items: center;
    }
    .main-nav li a {
      padding: 8px 14px; border-radius: var(--radius-sm);
      font-size: 14px; font-weight: 500;
      color: var(--smoke); transition: all .2s;
    }
    .main-nav li a:hover { color: var(--ink); background: var(--cream); }
    .main-nav li a.active { color: var(--ink); font-weight: 600; }
    .search-bar {
      display: flex; align-items: center; gap: 10px;
      background: var(--cream); border-radius: 999px;
      padding: 10px 16px; min-width: 220px;
      border: 1.5px solid transparent; transition: border-color .2s;
    }
    .search-bar:focus-within { border-color: var(--gold-light); }
    .search-bar input {
      border: none; background: transparent; outline: none;
      font-size: 13.5px; font-family: 'DM Sans', sans-serif; width: 100%;
      color: var(--ink);
    }
    .search-bar input::placeholder { color: var(--smoke); }
    .search-bar button { background: none; border: none; cursor: pointer; color: var(--smoke); font-size: 13px; }
    .header-actions { display: flex; align-items: center; gap: 8px; }
    .icon-btn {
      width: 40px; height: 40px; border-radius: 10px;
      display: inline-grid; place-items: center;
      color: var(--charcoal); background: transparent;
      border: none; cursor: pointer; transition: background .2s; font-size: 15px;
    }
    .icon-btn:hover { background: var(--cream); }
    .cart-pill {
      display: flex; align-items: center; gap: 8px;
      background: var(--ink); color: var(--white);
      padding: 8px 16px; border-radius: 999px;
      font-size: 13px; font-weight: 600; cursor: pointer;
      transition: transform .15s, box-shadow .15s;
    }
    .cart-pill:hover { transform: translateY(-1px); box-shadow: 0 6px 20px rgba(0,0,0,0.15); }
    .cart-badge {
      background: var(--gold); color: var(--ink);
      font-size: 11px; font-weight: 700;
      min-width: 20px; height: 20px;
      border-radius: 999px; display: grid; place-items: center;
      padding: 0 5px;
    }
    .mobile-toggle { display: none; }

    /* ── ANNOUNCEMENT STRIP ── */
    .announcement {
      background: var(--ink); color: var(--gold-light);
      text-align: center; font-size: 12.5px; font-weight: 500;
      padding: 8px 20px; letter-spacing: 0.04em;
    }
    .announcement span { color: var(--gold); }

    /* ── HERO ── */
    .hero {
      min-height: 88vh; display: grid;
      grid-template-columns: 1fr 1fr;
      max-width: 1280px; margin: 0 auto;
      padding: 60px 32px; gap: 40px;
      align-items: center;
    }
    .hero-text { animation: fadeUp .7s ease both; }
    .hero-eyebrow {
      display: inline-flex; align-items: center; gap: 8px;
      background: var(--gold-light); color: #7a5a10;
      padding: 6px 14px; border-radius: 999px;
      font-size: 12px; font-weight: 600; letter-spacing: 0.08em;
      text-transform: uppercase; margin-bottom: 22px;
    }
    .hero-eyebrow::before {
      content: ''; width: 6px; height: 6px;
      background: var(--gold); border-radius: 50%;
    }
    .hero h1 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(42px, 5vw, 70px);
      line-height: 1.05; font-weight: 900;
      letter-spacing: -0.03em; margin-bottom: 20px;
    }
    .hero h1 em { font-style: italic; color: var(--gold); }
    .hero p {
      font-size: 17px; color: var(--smoke); line-height: 1.65;
      max-width: 480px; margin-bottom: 36px; font-weight: 300;
    }
    .hero-cta { display: flex; gap: 12px; flex-wrap: wrap; }
    .btn-primary {
      display: inline-flex; align-items: center; gap: 10px;
      background: var(--ink); color: var(--white);
      padding: 14px 28px; border-radius: 999px;
      font-size: 14px; font-weight: 600; border: none; cursor: pointer;
      transition: transform .15s, box-shadow .15s;
    }
    .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 10px 30px rgba(0,0,0,0.2); }
    .btn-primary .arrow { transition: transform .2s; }
    .btn-primary:hover .arrow { transform: translateX(4px); }
    .btn-secondary {
      display: inline-flex; align-items: center; gap: 10px;
      background: transparent; color: var(--ink);
      padding: 13px 28px; border-radius: 999px;
      font-size: 14px; font-weight: 600;
      border: 2px solid rgba(13,13,13,0.15); cursor: pointer;
      transition: border-color .2s, background .2s;
    }
    .btn-secondary:hover { border-color: var(--ink); background: var(--cream); }
    .hero-stats {
      display: flex; gap: 32px; margin-top: 44px;
      padding-top: 32px; border-top: 1px solid rgba(13,13,13,0.08);
    }
    .stat-item .num {
      font-family: 'Playfair Display', serif;
      font-size: 28px; font-weight: 700; letter-spacing: -0.02em;
    }
    .stat-item .label { font-size: 12px; color: var(--smoke); font-weight: 500; margin-top: 2px; }
    .hero-image {
      position: relative; animation: fadeUp .7s .15s ease both;
    }
    .hero-image .main-img {
      width: 100%; height: 520px; object-fit: cover;
      border-radius: var(--radius-lg); display: block;
    }
    .hero-float-card {
      position: absolute; bottom: 28px; left: -24px;
      background: var(--white); border-radius: var(--radius-md);
      padding: 16px 20px; box-shadow: var(--shadow-lg);
      display: flex; align-items: center; gap: 14px;
      animation: float 3s ease-in-out infinite;
    }
    .hero-float-card .icon-wrap {
      width: 44px; height: 44px; background: var(--gold-light);
      border-radius: 12px; display: grid; place-items: center;
      font-size: 18px; color: var(--gold);
    }
    .hero-float-card .text .title { font-weight: 600; font-size: 14px; }
    .hero-float-card .text .sub { font-size: 12px; color: var(--smoke); margin-top: 2px; }
    .hero-float-badge {
      position: absolute; top: 24px; right: -16px;
      background: var(--ink); color: var(--gold-light);
      border-radius: var(--radius-md); padding: 12px 18px;
      font-size: 13px; font-weight: 600; box-shadow: var(--shadow-md);
      animation: float 3.5s 0.5s ease-in-out infinite;
    }
    .hero-float-badge .big { font-family: 'Playfair Display', serif; font-size: 26px; font-weight: 900; color: var(--gold); }

    @keyframes float {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-10px); }
    }
    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }

    /* ── TRUST BAR ── */
    .trust-bar {
      background: var(--cream);
      border-top: 1px solid rgba(201,168,76,0.15);
      border-bottom: 1px solid rgba(201,168,76,0.15);
    }
    .trust-inner {
      max-width: 1280px; margin: 0 auto; padding: 0 32px;
      display: grid; grid-template-columns: repeat(4, 1fr);
    }
    .trust-item {
      display: flex; align-items: center; gap: 14px;
      padding: 22px 0; border-right: 1px solid rgba(201,168,76,0.15);
      padding-right: 28px; margin-right: 28px;
    }
    .trust-item:last-child { border-right: none; }
    .trust-icon {
      width: 46px; height: 46px; border-radius: 12px;
      background: var(--white); display: grid; place-items: center;
      font-size: 18px; color: var(--gold); box-shadow: var(--shadow-sm); flex-shrink: 0;
    }
    .trust-text .t { font-weight: 600; font-size: 14px; }
    .trust-text .s { font-size: 12px; color: var(--smoke); margin-top: 2px; }

    /* ── SECTION BASE ── */
    .section { padding: 80px 0; }
    .container { max-width: 1280px; margin: 0 auto; padding: 0 32px; }
    .section-header { margin-bottom: 44px; }
    .section-header .eyebrow {
      display: inline-block; font-size: 11px; font-weight: 700;
      letter-spacing: 0.12em; text-transform: uppercase;
      color: var(--gold); margin-bottom: 10px;
    }
    .section-header h2 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(28px, 3.5vw, 44px); font-weight: 900;
      letter-spacing: -0.025em; line-height: 1.1;
    }
    .section-header p { color: var(--smoke); margin-top: 10px; font-size: 15px; font-weight: 300; }

    /* ── CATEGORIES ── */
    .categories-grid {
      display: grid; grid-template-columns: repeat(6, 1fr); gap: 14px;
    }
    .cat-card {
      background: var(--white); border-radius: var(--radius-md);
      padding: 24px 16px; text-align: center; cursor: pointer;
      border: 1.5px solid transparent;
      transition: all .25s cubic-bezier(.25,.46,.45,.94);
      box-shadow: var(--shadow-sm);
    }
    .cat-card:hover {
      border-color: var(--gold-light);
      transform: translateY(-6px);
      box-shadow: 0 16px 40px rgba(201,168,76,0.15);
    }
    .cat-card .cat-icon {
      width: 54px; height: 54px; border-radius: 16px;
      background: var(--cream); display: grid; place-items: center;
      font-size: 22px; color: var(--gold); margin: 0 auto 14px; transition: background .2s;
    }
    .cat-card:hover .cat-icon { background: var(--gold-light); }
    .cat-card h4 { font-size: 13px; font-weight: 600; margin-bottom: 4px; }
    .cat-card span { font-size: 11px; color: var(--smoke); }

    /* ── PRODUCTS ── */
    .products-header {
      display: flex; align-items: flex-end; justify-content: space-between;
      margin-bottom: 36px;
    }
    .filter-tabs { display: flex; gap: 8px; flex-wrap: wrap; margin-top: 16px; }
    .filter-tab {
      padding: 7px 16px; border-radius: 999px; font-size: 13px; font-weight: 500;
      border: 1.5px solid rgba(13,13,13,0.12); cursor: pointer;
      transition: all .2s; background: transparent; color: var(--smoke);
    }
    .filter-tab.active, .filter-tab:hover {
      background: var(--ink); color: var(--white); border-color: var(--ink);
    }
    .view-all-link {
      font-size: 13px; font-weight: 600; color: var(--smoke);
      display: flex; align-items: center; gap: 6px;
      white-space: nowrap; transition: color .2s;
    }
    .view-all-link:hover { color: var(--ink); }
    .products-grid {
      display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px;
    }
    .product-card {
      background: var(--white); border-radius: var(--radius-md);
      overflow: hidden; cursor: pointer; position: relative;
      transition: transform .25s, box-shadow .25s;
      box-shadow: var(--shadow-sm);
      display: flex; flex-direction: column;
    }
    .product-card:hover { transform: translateY(-8px); box-shadow: var(--shadow-lg); }
    .product-img-wrap { position: relative; overflow: hidden; }
    .product-card img {
      width: 100%; height: 220px; object-fit: cover; display: block;
      transition: transform .4s ease;
    }
    .product-card:hover img { transform: scale(1.06); }
    .product-badge {
      position: absolute; top: 12px; left: 12px;
      background: var(--ink); color: var(--gold-light);
      font-size: 10px; font-weight: 700; letter-spacing: 0.06em;
      text-transform: uppercase; padding: 4px 10px; border-radius: 999px;
    }
    .product-badge.sale { background: #c0392b; color: white; }
    .product-actions {
      position: absolute; top: 12px; right: 12px;
      display: flex; flex-direction: column; gap: 6px;
      opacity: 0; transform: translateX(8px); transition: all .25s;
    }
    .product-card:hover .product-actions { opacity: 1; transform: translateX(0); }
    .product-action-btn {
      width: 34px; height: 34px; border-radius: 10px;
      background: rgba(255,255,255,0.92); backdrop-filter: blur(10px);
      border: none; cursor: pointer; display: grid; place-items: center;
      font-size: 13px; color: var(--ink); transition: background .2s;
    }
    .product-action-btn:hover { background: var(--white); color: var(--gold); }
    .product-body { padding: 16px 18px; flex: 1; display: flex; flex-direction: column; gap: 8px; }
    .product-category { font-size: 11px; color: var(--smoke); font-weight: 500; text-transform: uppercase; letter-spacing: 0.06em; }
    .product-title { font-size: 15px; font-weight: 600; line-height: 1.3; }
    .product-rating {
      display: flex; align-items: center; gap: 6px;
    }
    .stars { color: #f0b429; font-size: 12px; letter-spacing: 1px; }
    .rating-count { font-size: 12px; color: var(--smoke); }
    .product-footer {
      display: flex; align-items: center; justify-content: space-between;
      padding: 14px 18px; border-top: 1px solid var(--cream);
    }
    .price-group { display: flex; align-items: baseline; gap: 8px; }
    .price-now { font-size: 17px; font-weight: 700; }
    .price-old { font-size: 13px; color: var(--smoke); text-decoration: line-through; font-weight: 400; }
    .add-to-cart {
      display: flex; align-items: center; gap: 8px;
      background: var(--ink); color: var(--white);
      padding: 8px 16px; border-radius: 999px; font-size: 13px; font-weight: 600;
      border: none; cursor: pointer; transition: all .2s;
    }
    .add-to-cart:hover { background: var(--charcoal); transform: scale(1.03); }

    /* ── DEAL SECTION ── */
    .deal-section { background: var(--ink); color: var(--white); overflow: hidden; position: relative; }
    .deal-section::before {
      content: ''; position: absolute; inset: 0;
      background: radial-gradient(ellipse at 70% 50%, rgba(201,168,76,0.12) 0%, transparent 60%);
    }
    .deal-inner {
      max-width: 1280px; margin: 0 auto; padding: 80px 32px;
      display: grid; grid-template-columns: 1fr 1fr; gap: 80px; align-items: center;
      position: relative;
    }
    .deal-eyebrow {
      display: inline-flex; align-items: center; gap: 8px;
      background: rgba(201,168,76,0.15); color: var(--gold-light);
      padding: 6px 14px; border-radius: 999px;
      font-size: 12px; font-weight: 600; letter-spacing: 0.08em;
      text-transform: uppercase; margin-bottom: 18px;
    }
    .deal-inner h2 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(32px, 4vw, 52px); font-weight: 900;
      letter-spacing: -0.02em; line-height: 1.1; margin-bottom: 14px;
    }
    .deal-inner h2 em { color: var(--gold); font-style: italic; }
    .deal-inner p { color: rgba(255,255,255,0.6); font-size: 15px; font-weight: 300; margin-bottom: 28px; }
    .deal-price-row { display: flex; align-items: center; gap: 14px; margin-bottom: 28px; }
    .deal-price { font-family: 'Playfair Display', serif; font-size: 42px; font-weight: 900; color: var(--gold); }
    .deal-old-price { font-size: 18px; color: rgba(255,255,255,0.4); text-decoration: line-through; }
    .deal-discount-badge {
      background: #c0392b; color: white;
      padding: 6px 12px; border-radius: 999px;
      font-size: 13px; font-weight: 700;
    }
    .timer { display: flex; gap: 12px; margin-bottom: 36px; }
    .time-unit {
      text-align: center; min-width: 70px;
    }
    .time-num {
      font-family: 'Playfair Display', serif;
      font-size: 34px; font-weight: 900; color: var(--gold);
      background: rgba(201,168,76,0.1);
      border: 1px solid rgba(201,168,76,0.2);
      border-radius: 12px; padding: 10px 14px; display: block;
      line-height: 1;
    }
    .time-label { font-size: 10px; color: rgba(255,255,255,0.45); font-weight: 600; letter-spacing: 0.08em; text-transform: uppercase; margin-top: 6px; }
    .deal-image { position: relative; }
    .deal-image img {
      width: 100%; height: 480px; object-fit: cover;
      border-radius: var(--radius-lg);
    }
    .deal-image-overlay {
      position: absolute; inset: 0; border-radius: var(--radius-lg);
      background: linear-gradient(135deg, rgba(13,13,13,0.3), transparent);
    }
    .deal-tag {
      position: absolute; bottom: 24px; right: 24px;
      background: var(--gold); color: var(--ink);
      padding: 10px 20px; border-radius: 999px;
      font-weight: 700; font-size: 14px;
    }

    /* ── TESTIMONIALS ── */
    .testimonials-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
    .testimonial-card {
      background: var(--white); border-radius: var(--radius-md);
      padding: 28px; box-shadow: var(--shadow-sm);
      border: 1px solid var(--cream); transition: box-shadow .2s;
    }
    .testimonial-card:hover { box-shadow: var(--shadow-md); }
    .testimonial-stars { color: #f0b429; font-size: 14px; margin-bottom: 14px; }
    .testimonial-text { font-size: 15px; line-height: 1.65; color: var(--charcoal); font-weight: 300; margin-bottom: 20px; }
    .testimonial-author { display: flex; align-items: center; gap: 12px; }
    .testimonial-avatar { width: 42px; height: 42px; border-radius: 50%; object-fit: cover; }
    .testimonial-name { font-weight: 600; font-size: 14px; }
    .testimonial-role { font-size: 12px; color: var(--smoke); margin-top: 2px; }

    /* ── NEWSLETTER ── */
    .newsletter-section {
      background: linear-gradient(135deg, #1a1a1a 0%, #0d0d0d 100%);
      border-radius: var(--radius-lg); margin: 0 32px 80px;
      padding: 72px 64px; text-align: center; position: relative; overflow: hidden;
    }
    .newsletter-section::before {
      content: ''; position: absolute; top: -50%; left: 50%; transform: translateX(-50%);
      width: 600px; height: 600px; border-radius: 50%;
      background: radial-gradient(circle, rgba(201,168,76,0.1) 0%, transparent 70%);
    }
    .newsletter-section h2 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(28px, 4vw, 46px); font-weight: 900;
      color: var(--white); letter-spacing: -0.02em; margin-bottom: 12px;
      position: relative;
    }
    .newsletter-section h2 em { color: var(--gold); font-style: italic; }
    .newsletter-section p { color: rgba(255,255,255,0.55); font-size: 15px; margin-bottom: 32px; font-weight: 300; position: relative; }
    .newsletter-form { display: flex; gap: 10px; justify-content: center; max-width: 520px; margin: 0 auto; position: relative; }
    .newsletter-form input {
      flex: 1; padding: 14px 20px; border-radius: 999px;
      border: 1px solid rgba(201,168,76,0.2); background: rgba(255,255,255,0.06);
      color: var(--white); font-size: 14px; font-family: 'DM Sans', sans-serif; outline: none;
      transition: border-color .2s;
    }
    .newsletter-form input::placeholder { color: rgba(255,255,255,0.35); }
    .newsletter-form input:focus { border-color: var(--gold-light); }
    .newsletter-form button {
      background: var(--gold); color: var(--ink);
      padding: 14px 28px; border-radius: 999px;
      font-size: 14px; font-weight: 700; border: none; cursor: pointer;
      transition: transform .15s, box-shadow .15s; white-space: nowrap;
    }
    .newsletter-form button:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(201,168,76,0.3); }
    #newsletter-msg { margin-top: 14px; font-size: 13px; color: var(--gold-light); min-height: 20px; }

    /* ── FOOTER ── */
    footer {
      background: var(--cream); border-top: 1px solid rgba(13,13,13,0.06);
      padding: 60px 0 30px;
    }
    .footer-inner {
      max-width: 1280px; margin: 0 auto; padding: 0 32px;
      display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 48px;
    }
    .footer-brand .logo-text {
      font-family: 'Playfair Display', serif;
      font-size: 22px; font-weight: 900; letter-spacing: -0.02em; margin-bottom: 12px;
    }
    .footer-brand p { color: var(--smoke); font-size: 14px; line-height: 1.65; font-weight: 300; }
    .footer-social { display: flex; gap: 10px; margin-top: 20px; }
    .social-btn {
      width: 38px; height: 38px; border-radius: 10px; background: var(--white);
      display: grid; place-items: center; color: var(--charcoal);
      font-size: 14px; transition: all .2s; box-shadow: var(--shadow-sm);
    }
    .social-btn:hover { background: var(--ink); color: var(--gold-light); transform: translateY(-2px); }
    .footer-col h5 { font-weight: 700; font-size: 14px; margin-bottom: 16px; }
    .footer-col ul { list-style: none; display: flex; flex-direction: column; gap: 10px; }
    .footer-col ul li a { font-size: 14px; color: var(--smoke); font-weight: 300; transition: color .2s; }
    .footer-col ul li a:hover { color: var(--ink); }
    .footer-bottom {
      max-width: 1280px; margin: 40px auto 0; padding: 20px 32px 0;
      border-top: 1px solid rgba(13,13,13,0.08);
      display: flex; justify-content: space-between; align-items: center;
      font-size: 13px; color: var(--smoke);
    }

    /* ── MOBILE MENU ── */
    #mobile-menu {
      display: none; background: var(--paper); border-top: 1px solid var(--cream);
      padding: 16px 24px 24px;
    }
    #mobile-menu ul { list-style: none; display: flex; flex-direction: column; gap: 4px; }
    #mobile-menu li a {
      display: block; padding: 10px 14px; border-radius: 8px;
      font-size: 15px; font-weight: 500; color: var(--charcoal); transition: background .15s;
    }
    #mobile-menu li a:hover { background: var(--cream); }

    /* ── RESPONSIVE ── */
    @media (max-width: 1100px) {
      .categories-grid { grid-template-columns: repeat(3, 1fr); }
      .products-grid { grid-template-columns: repeat(3, 1fr); }
      .footer-inner { grid-template-columns: 1fr 1fr; gap: 36px; }
    }
    @media (max-width: 900px) {
      .hero { grid-template-columns: 1fr; min-height: auto; gap: 48px; padding-top: 40px; }
      .hero-image .main-img { height: 360px; }
      .hero-float-card { left: 12px; }
      .hero-float-badge { right: 12px; }
      .main-nav { display: none; }
      .mobile-toggle { display: block; }
      .search-bar { min-width: 0; width: 180px; }
      .deal-inner { grid-template-columns: 1fr; gap: 40px; }
      .deal-image img { height: 320px; }
      .trust-inner { grid-template-columns: repeat(2, 1fr); }
      .testimonials-grid { grid-template-columns: 1fr 1fr; }
      .newsletter-section { margin: 0 16px 60px; padding: 48px 32px; }
    }
    @media (max-width: 640px) {
      .categories-grid { grid-template-columns: repeat(2, 1fr); }
      .products-grid { grid-template-columns: 1fr 1fr; }
      .trust-inner { grid-template-columns: 1fr; }
      .testimonials-grid { grid-template-columns: 1fr; }
      .footer-inner { grid-template-columns: 1fr; }
      .header-inner { padding: 0 16px; }
      .container { padding: 0 16px; }
      .newsletter-section { margin: 0 12px 48px; padding: 36px 20px; }
      .newsletter-form { flex-direction: column; }
      .hero-stats { gap: 20px; }
      .products-grid { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>

  <div class="announcement">
    ✦ Free shipping on orders over $75 — Use code <span>NEXUS20</span> for 20% off ✦
  </div>

  <header>
    <div class="header-inner">
      <div style="display:flex;align-items:center;gap:14px">
        <button class="mobile-toggle icon-btn" id="mobileToggle" aria-label="Menu">
          <i class="fas fa-bars"></i>
        </button>
        <a class="brand" href="#">Nexus<span class="dot">.</span>Shop</a>
      </div>

      <nav class="main-nav" aria-label="Primary navigation">
        <ul>
          <li><a href="#" class="active">Home</a></li>
          <li><a href="#categories">Categories</a></li>
          <li><a href="#products">Trending</a></li>
          <li><a href="#deals">Deals</a></li>
          <li><a href="#about">About</a></li>
        </ul>
      </nav>

      <div style="display:flex;align-items:center;gap:12px">
        <div class="search-bar">
          <button class="search-bar button" aria-label="Search"><i class="fas fa-search"></i></button>
          <input type="search" id="searchInput" placeholder="Search products…" aria-label="Search">
        </div>
        <div class="header-actions">
          <button class="icon-btn" title="Account"><i class="far fa-user"></i></button>
          <button class="icon-btn" title="Wishlist"><i class="far fa-heart"></i></button>
          <div class="cart-pill" id="cartBtn" role="button" title="Cart">
            <i class="fas fa-bag-shopping"></i>
            Cart
            <span class="cart-badge" id="cartCount">0</span>
          </div>
        </div>
      </div>
    </div>
    <div id="mobile-menu">
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#categories">Categories</a></li>
        <li><a href="#products">Trending</a></li>
        <li><a href="#deals">Deals</a></li>
        <li><a href="#about">About</a></li>
      </ul>
    </div>
  </header>

  <main>
    <!-- HERO -->
    <section class="container" style="padding-top:0">
      <div class="hero">
        <div class="hero-text">
          <div class="hero-eyebrow">New Collection 2025</div>
          <h1>Discover <em>Premium</em> Picks for You</h1>
          <p>Curated fashion, technology & accessories — thoughtfully selected, beautifully delivered. Enjoy exclusive deals and free shipping on selected items.</p>
          <div class="hero-cta">
            <button class="btn-primary" id="shopNow">Shop Now <span class="arrow"><i class="fas fa-arrow-right"></i></span></button>
            <button class="btn-secondary" id="exploreDeals">Explore Deals</button>
          </div>
          <div class="hero-stats">
            <div class="stat-item"><div class="num">12K+</div><div class="label">Happy Customers</div></div>
            <div class="stat-item"><div class="num">4.9★</div><div class="label">Average Rating</div></div>
            <div class="stat-item"><div class="num">300+</div><div class="label">Products</div></div>
          </div>
        </div>
        <div class="hero-image">
          <img class="main-img" src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?auto=format&fit=crop&w=900&q=80" alt="Featured collection">
          <div class="hero-float-card">
            <div class="icon-wrap"><i class="fas fa-truck"></i></div>
            <div class="text">
              <div class="title">Free Delivery</div>
              <div class="sub">Orders over $75</div>
            </div>
          </div>
          <div class="hero-float-badge">
            <div class="big">-20%</div>
            <div style="font-size:12px;color:rgba(255,255,255,0.7);margin-top:2px">Today only</div>
          </div>
        </div>
      </div>
    </section>

    <!-- TRUST BAR -->
    <div class="trust-bar">
      <div class="trust-inner">
        <div class="trust-item">
          <div class="trust-icon"><i class="fas fa-truck-fast"></i></div>
          <div class="trust-text"><div class="t">Free Shipping</div><div class="s">On orders over $75</div></div>
        </div>
        <div class="trust-item">
          <div class="trust-icon"><i class="fas fa-rotate-left"></i></div>
          <div class="trust-text"><div class="t">Easy Returns</div><div class="s">30-day guarantee</div></div>
        </div>
        <div class="trust-item">
          <div class="trust-icon"><i class="fas fa-shield-halved"></i></div>
          <div class="trust-text"><div class="t">Secure Payment</div><div class="s">256-bit encryption</div></div>
        </div>
        <div class="trust-item">
          <div class="trust-icon"><i class="fas fa-headset"></i></div>
          <div class="trust-text"><div class="t">24/7 Support</div><div class="s">Always here for you</div></div>
        </div>
      </div>
    </div>

    <!-- CATEGORIES -->
    <section class="section" id="categories">
      <div class="container">
        <div class="section-header">
          <div class="eyebrow">Browse</div>
          <h2>Shop by Category</h2>
          <p>Explore our curated product universe</p>
        </div>
        <div class="categories-grid" id="categoriesGrid"></div>
      </div>
    </section>

    <!-- PRODUCTS -->
    <section class="section" id="products" style="background:var(--cream);border-radius:var(--radius-lg);margin:0 0 0 0;padding:80px 0">
      <div class="container">
        <div class="products-header">
          <div class="section-header" style="margin-bottom:0">
            <div class="eyebrow">Popular</div>
            <h2>Trending Products</h2>
            <div class="filter-tabs" id="filterTabs">
              <button class="filter-tab active" data-filter="all">All</button>
              <button class="filter-tab" data-filter="phones">Phones</button>
              <button class="filter-tab" data-filter="laptops">Laptops</button>
              <button class="filter-tab" data-filter="gadgets">Gadgets</button>
              <button class="filter-tab" data-filter="accessories">Accessories</button>
              <button class="filter-tab" data-filter="footwear">Footwear</button>
            </div>
          </div>
          <a href="#" class="view-all-link">View all <i class="fas fa-arrow-right" style="font-size:11px"></i></a>
        </div>
        <div class="products-grid" id="productsGrid"></div>
      </div>
    </section>

    <!-- DEAL / FLASH SALE -->
    <section class="deal-section" id="deals">
      <div class="deal-inner">
        <div>
          <div class="deal-eyebrow">⚡ Flash Sale</div>
          <h2>MacBook Air <em>M2</em></h2>
          <p>Impossibly thin, remarkably capable — now at its lowest price ever. Limited units available.</p>
          <div class="deal-price-row">
            <div class="deal-price">$999</div>
            <div class="deal-old-price">$1,199</div>
            <div class="deal-discount-badge">-17%</div>
          </div>
          <div class="timer">
            <div class="time-unit"><span class="time-num" id="dealDays">0</span><div class="time-label">Days</div></div>
            <div class="time-unit"><span class="time-num" id="dealHours">00</span><div class="time-label">Hours</div></div>
            <div class="time-unit"><span class="time-num" id="dealMinutes">00</span><div class="time-label">Mins</div></div>
            <div class="time-unit"><span class="time-num" id="dealSeconds">00</span><div class="time-label">Secs</div></div>
          </div>
          <p style="color:rgba(255,255,255,0.5);font-size:13px;margin-bottom:24px;">Only <strong style="color:var(--gold)">12 items</strong> left at this price!</p>
          <button class="btn-primary" id="buyDeal" style="font-size:15px;padding:16px 32px">
            Grab This Deal <i class="fas fa-bolt"></i>
          </button>
        </div>
        <div class="deal-image">
          <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=900&q=80" alt="MacBook Air M2">
          <div class="deal-image-overlay"></div>
          <div class="deal-tag">Limited Stock</div>
        </div>
      </div>
    </section>

    <!-- TESTIMONIALS -->
    <section class="section">
      <div class="container">
        <div class="section-header" style="text-align:center">
          <div class="eyebrow">Reviews</div>
          <h2>What Customers Say</h2>
          <p>Real stories from verified buyers</p>
        </div>
        <div class="testimonials-grid">
          <div class="testimonial-card">
            <div class="testimonial-stars">★★★★★</div>
            <p class="testimonial-text">"Fast shipping and excellent customer support. The product exceeded every single one of my expectations — absolutely worth it!"</p>
            <div class="testimonial-author">
              <img class="testimonial-avatar" src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80" alt="Ava Martin">
              <div><div class="testimonial-name">Ava Martin</div><div class="testimonial-role">Verified buyer</div></div>
            </div>
          </div>
          <div class="testimonial-card">
            <div class="testimonial-stars">★★★★☆</div>
            <p class="testimonial-text">"Great selection and the checkout was incredibly smooth. The packaging was beautiful and delivery was faster than expected."</p>
            <div class="testimonial-author">
              <img class="testimonial-avatar" src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=80&q=80" alt="Michael Lee">
              <div><div class="testimonial-name">Michael Lee</div><div class="testimonial-role">Frequent buyer</div></div>
            </div>
          </div>
          <div class="testimonial-card">
            <div class="testimonial-stars">★★★★★</div>
            <p class="testimonial-text">"I've tried many online stores and NexusShop is simply the best. Amazing curation, fair prices and a seamless experience."</p>
            <div class="testimonial-author">
              <img class="testimonial-avatar" src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=80&q=80" alt="Sofia Reyes">
              <div><div class="testimonial-name">Sofia Reyes</div><div class="testimonial-role">Verified buyer</div></div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- NEWSLETTER -->
    <div class="newsletter-section" id="about">
      <h2>Stay <em>In The Loop</em></h2>
      <p>Subscribe for exclusive offers, early access drops & curated picks</p>
      <div class="newsletter-form">
        <input type="email" id="newsletterEmail" placeholder="Enter your email address">
        <button id="subscribeBtn">Subscribe</button>
      </div>
      <div id="newsletter-msg"></div>
    </div>
  </main>

  <footer>
    <div class="footer-inner">
      <div class="footer-brand">
        <div class="logo-text">Nexus<span style="color:var(--gold)">.</span>Shop</div>
        <p>A modern e-commerce experience built with care and attention to detail. Quality products, exceptional service.</p>
        <div class="footer-social">
          <a class="social-btn" href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
          <a class="social-btn" href="#" title="Twitter"><i class="fab fa-x-twitter"></i></a>
          <a class="social-btn" href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
          <a class="social-btn" href="#" title="Pinterest"><i class="fab fa-pinterest-p"></i></a>
        </div>
      </div>
      <div class="footer-col">
        <h5>Company</h5>
        <ul>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Careers</a></li>
          <li><a href="#">Press</a></li>
          <li><a href="#">Blog</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h5>Support</h5>
        <ul>
          <li><a href="#">Help Center</a></li>
          <li><a href="#">Shipping & Returns</a></li>
          <li><a href="#">Order Tracking</a></li>
          <li><a href="#">Contact Us</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h5>Legal</h5>
        <ul>
          <li><a href="#">Privacy Policy</a></li>
          <li><a href="#">Terms of Service</a></li>
          <li><a href="#">Cookie Policy</a></li>
          <li><a href="#">Sitemap</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      <span>© <span id="year"></span> NexusShop. All rights reserved.</span>
      <span style="display:flex;align-items:center;gap:8px"><i class="fab fa-cc-visa" style="font-size:22px"></i><i class="fab fa-cc-mastercard" style="font-size:22px"></i><i class="fab fa-cc-paypal" style="font-size:22px"></i><i class="fab fa-cc-apple-pay" style="font-size:22px"></i></span>
    </div>
  </footer>

  <script>
    // ── DATA ──
    const CATEGORIES = [
      { id:'phones',      name:'Smartphones', icon:'fa-mobile-alt',  count:42 },
      { id:'laptops',     name:'Laptops',     icon:'fa-laptop',      count:28 },
      { id:'clothing',    name:'Clothing',    icon:'fa-shirt',       count:115 },
      { id:'gadgets',     name:'Gadgets',     icon:'fa-headphones',  count:67 },
      { id:'footwear',    name:'Footwear',    icon:'fa-shoe-prints', count:53 },
      { id:'accessories', name:'Accessories', icon:'fa-watch',       count:89 }
    ];

    const PRODUCTS = [
      { id:1, title:'iPhone 14 Pro Max',    price:1099, oldPrice:1199, rating:5, reviews:128, badge:'New',  img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80', category:'phones' },
      { id:2, title:'MacBook Pro 14"',      price:1999, oldPrice:null, rating:4, reviews:86,  badge:null,   img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80', category:'laptops' },
      { id:3, title:'Apple Watch Series 8', price:349,  oldPrice:399,  rating:5, reviews:214, badge:'-25%', img:'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
      { id:4, title:'Nike Air Max 270',     price:150,  oldPrice:null, rating:4, reviews:53,  badge:null,   img:'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80', category:'footwear' },
      { id:5, title:'Sony A7 IV Camera',    price:2499, oldPrice:null, rating:5, reviews:42,  badge:'Hot',  img:'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
      { id:6, title:'Chanel No. 5',         price:120,  oldPrice:null, rating:5, reviews:189, badge:null,   img:'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80', category:'accessories' },
      { id:7, title:'Travel Backpack',      price:79,   oldPrice:99,   rating:4, reviews:67,  badge:'-20%', img:'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
      { id:8, title:'Sony WH-1000XM5',      price:399,  oldPrice:null, rating:5, reviews:156, badge:'Top',  img:'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80', category:'gadgets' }
    ];

    let cartCount = 0;
    const cartCountEl = document.getElementById('cartCount');

    // ── RENDER CATEGORIES ──
    function renderCategories() {
      const grid = document.getElementById('categoriesGrid');
      grid.innerHTML = '';
      CATEGORIES.forEach(cat => {
        const el = document.createElement('div');
        el.className = 'cat-card';
        el.innerHTML = `
          <div class="cat-icon"><i class="fas ${cat.icon}"></i></div>
          <h4>${cat.name}</h4>
          <span>${cat.count} items</span>
        `;
        el.addEventListener('click', () => {
          filterProducts(cat.id);
          document.querySelectorAll('.filter-tab').forEach(t => t.classList.remove('active'));
          const tab = document.querySelector(`.filter-tab[data-filter="${cat.id}"]`);
          if (tab) tab.classList.add('active');
          document.getElementById('products').scrollIntoView({ behavior:'smooth', block:'start' });
        });
        grid.appendChild(el);
      });
    }

    // ── RENDER PRODUCTS ──
    function renderProducts(list) {
      const grid = document.getElementById('productsGrid');
      grid.innerHTML = '';
      if (!list.length) {
        grid.innerHTML = '<div style="grid-column:1/-1;text-align:center;padding:60px 0;color:var(--smoke)">No products found.</div>';
        return;
      }
      list.forEach(p => {
        const el = document.createElement('article');
        el.className = 'product-card';
        const stars = '★'.repeat(p.rating) + '☆'.repeat(5 - p.rating);
        const badgeClass = p.badge && p.badge.startsWith('-') ? 'sale' : '';
        el.innerHTML = `
          <div class="product-img-wrap">
            ${p.badge ? `<div class="product-badge ${badgeClass}">${p.badge}</div>` : ''}
            <img src="${p.img}" alt="${p.title}" loading="lazy">
            <div class="product-actions">
              <button class="product-action-btn" title="Wishlist"><i class="far fa-heart"></i></button>
              <button class="product-action-btn" title="Quick view"><i class="far fa-eye"></i></button>
            </div>
          </div>
          <div class="product-body">
            <div class="product-category">${p.category}</div>
            <div class="product-title">${p.title}</div>
            <div class="product-rating">
              <span class="stars">${stars}</span>
              <span class="rating-count">(${p.reviews})</span>
            </div>
          </div>
          <div class="product-footer">
            <div class="price-group">
              <div class="price-now">$${p.price.toLocaleString()}</div>
              ${p.oldPrice ? `<div class="price-old">$${p.oldPrice.toLocaleString()}</div>` : ''}
            </div>
            <button class="add-to-cart" data-id="${p.id}">
              <i class="fas fa-plus"></i> Add
            </button>
          </div>
        `;
        grid.appendChild(el);
      });
      grid.querySelectorAll('.add-to-cart').forEach(btn => {
        btn.addEventListener('click', () => {
          const id = Number(btn.dataset.id);
          addToCart(id);
        });
      });
    }

    function addToCart(id) {
      cartCount++;
      cartCountEl.textContent = cartCount;
      const btn = document.querySelector(`.add-to-cart[data-id="${id}"]`);
      if (btn) {
        btn.innerHTML = '<i class="fas fa-check"></i> Added';
        btn.style.background = 'var(--gold)';
        btn.style.color = 'var(--ink)';
        btn.disabled = true;
        setTimeout(() => {
          btn.innerHTML = '<i class="fas fa-plus"></i> Add';
          btn.style.background = '';
          btn.style.color = '';
          btn.disabled = false;
        }, 1400);
      }
    }

    function filterProducts(filter) {
      const list = filter === 'all' ? PRODUCTS : PRODUCTS.filter(p => p.category === filter || p.title.toLowerCase().includes(filter.toLowerCase()));
      renderProducts(list);
    }

    // ── FILTER TABS ──
    document.getElementById('filterTabs').addEventListener('click', e => {
      const tab = e.target.closest('.filter-tab');
      if (!tab) return;
      document.querySelectorAll('.filter-tab').forEach(t => t.classList.remove('active'));
      tab.classList.add('active');
      filterProducts(tab.dataset.filter);
    });

    // ── SEARCH ──
    const searchInput = document.getElementById('searchInput');
    searchInput.addEventListener('keydown', e => {
      if (e.key === 'Enter') {
        const q = e.target.value.trim().toLowerCase();
        const filtered = PRODUCTS.filter(p => p.title.toLowerCase().includes(q) || p.category.includes(q));
        renderProducts(filtered);
        document.getElementById('products').scrollIntoView({ behavior:'smooth', block:'start' });
      }
    });

    // ── MOBILE MENU ──
    document.getElementById('mobileToggle').addEventListener('click', () => {
      const m = document.getElementById('mobile-menu');
      m.style.display = m.style.display === 'block' ? 'none' : 'block';
    });

    // ── COUNTDOWN ──
    (function() {
      const target = new Date(Date.now() + (24*60 + 36)*60*1000);
      function tick() {
        const diff = target - Date.now();
        if (diff <= 0) return;
        document.getElementById('dealDays').textContent = Math.floor(diff / 86400000);
        document.getElementById('dealHours').textContent = String(Math.floor((diff % 86400000) / 3600000)).padStart(2,'0');
        document.getElementById('dealMinutes').textContent = String(Math.floor((diff % 3600000) / 60000)).padStart(2,'0');
        document.getElementById('dealSeconds').textContent = String(Math.floor((diff % 60000) / 1000)).padStart(2,'0');
      }
      tick(); setInterval(tick, 1000);
    })();

    // ── NEWSLETTER ──
    document.getElementById('subscribeBtn').addEventListener('click', () => {
      const email = document.getElementById('newsletterEmail').value.trim();
      const msg = document.getElementById('newsletter-msg');
      if (!email || !email.includes('@')) {
        msg.textContent = 'Please enter a valid email address.';
        msg.style.color = '#ff8080';
        return;
      }
      msg.textContent = '🎉 You\'re in! Check your inbox for a welcome gift.';
      msg.style.color = 'var(--gold-light)';
      document.getElementById('newsletterEmail').value = '';
      setTimeout(() => msg.textContent = '', 4000);
    });

    // ── HERO BUTTONS ──
    document.getElementById('shopNow').addEventListener('click', () => {
      document.getElementById('products').scrollIntoView({ behavior:'smooth' });
    });
    document.getElementById('exploreDeals').addEventListener('click', () => {
      document.getElementById('deals').scrollIntoView({ behavior:'smooth' });
    });
    document.getElementById('buyDeal').addEventListener('click', () => {
      cartCount++;
      cartCountEl.textContent = cartCount;
      const btn = document.getElementById('buyDeal');
      btn.textContent = '✓ Added to Cart!';
      setTimeout(() => { btn.innerHTML = 'Grab This Deal <i class="fas fa-bolt"></i>'; }, 2000);
    });

    // ── INIT ──
    renderCategories();
    renderProducts(PRODUCTS);
    document.getElementById('year').textContent = new Date().getFullYear();
  </script>
</body>
</html>
