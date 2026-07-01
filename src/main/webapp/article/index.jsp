<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Articles & Insights | IARDO</title>

<link rel="icon" type="image/webp"
	href="https://iardo.pages.dev/logo_iardo_wbg.webp">
<link rel="apple-touch-icon"
	href="https://iardo.pages.dev/logo_iardo_wbg.webp">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700;800;900&family=Source+Serif+4:ital,opsz,wght@0,8..60,400;0,8..60,600;1,8..60,400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
/* ================================================
       TOKENS
    ================================================ */
:root {
	--bg: #F0F4FF;
	--border: #D1D9F0;
	--dark: #1A1F3C;
	--accent: #6C63FF;
	--accent-dk: #5248d4;
	--accent-lt: #ECEAFF;
	--coral: #FF6B6B;
	--coral-dk: #e04f4f;
	--coral-lt: #FFF0F0;
	--surface: #ffffff;
	--surface-2: #F5F7FF;
	--text-body: #3D4466;
	--text-muted: #8B91B3;
	--border-card: #E2E8F5;
	--radius-card: 22px;
	--radius-tag: 100px;
	--shadow-sm: 0 2px 16px rgba(108, 99, 255, 0.07);
	--shadow-hover: 0 28px 60px rgba(26, 31, 60, 0.18);
	--ease: cubic-bezier(0.4, 0, 0.2, 1);
	--dur: 0.38s;
}

*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html {
	scroll-behavior: smooth;
}

body {
	background-color: var(--bg);
	font-family: 'Source Serif 4', serif;
	color: var(--text-body);
	-webkit-font-smoothing: antialiased;
	line-height: 1.65;
	background-image: radial-gradient(ellipse 70% 55% at 5% 0%, rgba(108, 99, 255, 0.08)
		0%, transparent 65%),
		radial-gradient(ellipse 55% 50% at 95% 100%, rgba(255, 107, 107, 0.06)
		0%, transparent 65%);
	background-attachment: fixed;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Montserrat', sans-serif;
	color: var(--dark);
	letter-spacing: -0.02em;
}

p, li, span, td, th, label {
	font-family: 'Source Serif 4', serif;
}

a, button, .btn, .navbar, nav {
	font-family: 'Montserrat', sans-serif;
	text-decoration: none;
	color: inherit;
}

/* ================================================
       ANIMATIONS
    ================================================ */
@
keyframes fadeUp {from { opacity:0;
	transform: translateY(28px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes shimmerMove { 0% {
	background-position: -600px 0;
}

100
%
{
background-position
:
600px
0;
}
}
@
keyframes tagSlide {from { opacity:0;
	transform: translateX(-8px);
}

to {
	opacity: 1;
	transform: translateX(0);
}

}
@
keyframes arrowBounce { 0%,100% {
	transform: translateX(0);
}

50
%
{
transform
:
translateX(
5px
);
}
}
@
keyframes underlineGrow {from { width:0;
	
}

to {
	width: 50px;
}

}

/* ================================================
       PAGE WRAPPER
    ================================================ */
.page-wrapper {
	padding-top: 80px;
	min-height: 80vh;
	padding-bottom: 120px;
}

/* ================================================
       HERO — SIMPLE CLEAN LIGHT
    ================================================ */
.hero {
	background: linen;
	padding: 64px 24px 56px;
	text-align: center;
	border-bottom: 1px solid var(--border-card);
	position: relative;
}

.hero-eyebrow {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	background: var(--accent-lt);
	border: 1px solid rgba(108, 99, 255, 0.22);
	color: var(--accent-dk);
	font-family: 'Montserrat', sans-serif;
	font-size: 0.68rem;
	font-weight: 700;
	letter-spacing: 0.12em;
	text-transform: uppercase;
	padding: 7px 18px;
	border-radius: 100px;
	margin-bottom: 22px;
	animation: fadeUp 0.6s var(--ease) both;
}

.hero-eyebrow i {
	color: var(--coral);
}

.hero h1 {
	font-size: clamp(2.2rem, 5vw, 3.6rem);
	font-weight: 900;
	color: var(--dark) !important;
	line-height: 1.12;
	margin-bottom: 16px;
	animation: fadeUp 0.65s var(--ease) both 0.08s;
}

.hero h1 em {
	font-style: normal;
	color: var(--accent) !important;
	position: relative;
}

.hero h1 em::after {
	content: '';
	position: absolute;
	bottom: 2px;
	left: 0;
	right: 0;
	height: 3px;
	background: linear-gradient(90deg, var(--accent), var(--coral));
	border-radius: 2px;
	opacity: 0.5;
}

.hero-desc {
	font-family: 'Source Serif 4', serif;
	font-size: 1.05rem;
	color: var(--text-muted);
	max-width: 540px;
	margin: 0 auto 32px;
	line-height: 1.75;
	animation: fadeUp 0.7s var(--ease) both 0.14s;
}

.hero-pills {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 10px;
	animation: fadeUp 0.75s var(--ease) both 0.20s;
}

.hero-pill {
	display: inline-flex;
	align-items: center;
	gap: 7px;
	background: var(--surface);
	border: 1px solid var(--border-card);
	color: var(--text-body);
	font-family: 'Montserrat', sans-serif;
	font-size: 0.74rem;
	font-weight: 600;
	padding: 7px 16px;
	border-radius: 100px;
	transition: background var(--dur) var(--ease), border-color var(--dur)
		var(--ease), color var(--dur) var(--ease);
	cursor: default;
}

.hero-pill:hover {
	background: var(--accent-lt);
	border-color: rgba(108, 99, 255, 0.30);
	color: var(--accent-dk);
}

.hero-pill i {
	font-size: 0.76rem;
	color: var(--accent);
}

/* ================================================
       CONTAINER
    ================================================ */
.container {
	max-width: 1280px;
	margin: 0 auto;
	padding: 64px 24px 0;
}

/* ================================================
       SECTION HEADER
    ================================================ */
.section-header {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 48px;
	animation: fadeUp 0.6s var(--ease) both 0.15s;
}

.section-header-left h3 {
	font-size: clamp(1.6rem, 3vw, 2.2rem);
	font-weight: 900;
	color: var(--dark) !important;
	margin-bottom: 6px;
}

.section-header-left p {
	font-size: 0.88rem;
	color: var(--text-muted);
	font-family: 'Montserrat', sans-serif;
}

.section-title-line {
	display: block;
	width: 50px;
	height: 4px;
	background: linear-gradient(90deg, var(--accent), var(--coral));
	border-radius: 2px;
	margin-top: 10px;
	animation: underlineGrow 0.6s var(--ease) both 0.4s;
}

.section-header-right {
	display: flex;
	align-items: center;
	gap: 8px;
	background: var(--surface);
	border: 1px solid var(--border-card);
	color: var(--accent-dk);
	font-family: 'Montserrat', sans-serif;
	font-size: 0.78rem;
	font-weight: 700;
	padding: 10px 22px;
	border-radius: 100px;
	white-space: nowrap;
	box-shadow: var(--shadow-sm);
}

.section-header-right i {
	color: var(--coral);
}

/* ================================================
       GRID
    ================================================ */
.articles-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 28px;
}

/* ================================================
       CARD BASE
    ================================================ */
.article-card {
	background: var(--surface);
	border: 1px solid var(--border-card);
	border-radius: var(--radius-card);
	overflow: hidden;
	display: flex;
	flex-direction: column;
	transition: transform var(--dur) var(--ease), box-shadow var(--dur)
		var(--ease), border-color var(--dur) var(--ease);
	box-shadow: var(--shadow-sm);
	position: relative;
	animation: fadeUp 0.6s var(--ease) both;
	will-change: transform;
	text-decoration: none;
	color: inherit;
}

.article-card:nth-child(1) {
	animation-delay: 0.05s;
}

.article-card:nth-child(2) {
	animation-delay: 0.10s;
}

.article-card:nth-child(3) {
	animation-delay: 0.15s;
}

.article-card:nth-child(4) {
	animation-delay: 0.20s;
}

.article-card:nth-child(5) {
	animation-delay: 0.25s;
}

.article-card:nth-child(6) {
	animation-delay: 0.30s;
}

.article-card:nth-child(7) {
	animation-delay: 0.35s;
}

.article-card:nth-child(8) {
	animation-delay: 0.40s;
}

.article-card:nth-child(9) {
	animation-delay: 0.45s;
}

.article-card:nth-child(10) {
	animation-delay: 0.50s;
}

.article-card:nth-child(11) {
	animation-delay: 0.55s;
}

.article-card:nth-child(12) {
	animation-delay: 0.60s;
}

.article-card:nth-child(13) {
	animation-delay: 0.65s;
}

.article-card:nth-child(14) {
	animation-delay: 0.70s;
}

.article-card:nth-child(15) {
	animation-delay: 0.75s;
}

/* shimmer top bar on hover */
.article-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 3px;
	background: linear-gradient(90deg, var(--accent), var(--coral),
		var(--accent));
	background-size: 200% 100%;
	opacity: 0;
	transition: opacity var(--dur) var(--ease);
	animation: shimmerMove 2.5s linear infinite paused;
	z-index: 3;
	border-radius: var(--radius-card) var(--radius-card) 0 0;
}

.article-card:hover::before {
	opacity: 1;
	animation-play-state: running;
}

.article-card:hover {
	transform: translateY(-10px);
	box-shadow: var(--shadow-hover);
	border-color: rgba(108, 99, 255, 0.22);
}

/* ================================================
       IMAGE WRAPPER
       Cards 1-6: images are local (may be portrait/landscape mix)
       → use contain + fixed height so image is NEVER cut
       Cards 7-15: images from iardo-blog CDN (wider/landscape)
       → same contain treatment for consistency
    ================================================ */
.card-img-wrap {
	width: 100%;
	flex-shrink: 0;
	background: var(--surface-2);
	border-bottom: 1px solid var(--border-card);
	position: relative;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	/* Fixed height — image never cut, shown fully */
	height: 230px;
}

/* Cards 1–6 get slightly more height because local images are often portrait */
.article-card:nth-child(1) .card-img-wrap, .article-card:nth-child(2) .card-img-wrap,
	.article-card:nth-child(3) .card-img-wrap, .article-card:nth-child(4) .card-img-wrap,
	.article-card:nth-child(5) .card-img-wrap, .article-card:nth-child(6) .card-img-wrap
	{
	height: 260px;
}

/* subtle tinted overlay on wrapper */
.card-img-wrap::after {
	content: '';
	position: absolute;
	inset: 0;
	background: linear-gradient(135deg, rgba(108, 99, 255, 0.03) 0%,
		transparent 60%, rgba(255, 107, 107, 0.03) 100%);
	pointer-events: none;
	z-index: 1;
	transition: opacity var(--dur) var(--ease);
}

.card-img-wrap img {
	/* contain = full image always visible, never cropped */
	width: 100%;
	height: 100%;
	object-fit: contain;
	object-position: center;
	display: block;
	padding: 10px; /* breathing room around image */
	transition: transform 0.50s var(--ease);
	position: relative;
	z-index: 2;
}

.article-card:hover .card-img-wrap img {
	transform: scale(1.04);
}

/* ================================================
       FEATURED CARD (card 1 — spans 2 cols)
    ================================================ */
.article-card.featured {
	grid-column: span 2;
	flex-direction: row;
}

.article-card.featured .card-img-wrap {
	width: 44%;
	height: auto;
	min-height: 280px;
	flex-shrink: 0;
	border-bottom: none;
	border-right: 1px solid var(--border-card);
	border-radius: 0;
}

.article-card.featured .card-img-wrap img {
	padding: 16px;
}

.article-card.featured .card-body {
	padding: 36px 30px;
	justify-content: center;
}

.article-card.featured .card-body h4 {
	font-size: 1.22rem;
	-webkit-line-clamp: 4;
}

/* ================================================
       CARD BODY
    ================================================ */
.card-body {
	padding: 26px 24px 20px;
	flex: 1;
	display: flex;
	flex-direction: column;
}

/* ================================================
       TAG
    ================================================ */
.tag {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	font-family: 'Montserrat', sans-serif;
	font-size: 0.67rem;
	font-weight: 800;
	text-transform: uppercase;
	letter-spacing: 0.08em;
	padding: 5px 13px;
	border-radius: var(--radius-tag);
	width: fit-content;
	margin-bottom: 13px;
	animation: tagSlide 0.4s var(--ease) both;
	transition: background var(--dur) var(--ease), color var(--dur)
		var(--ease), transform 0.2s var(--ease);
	color: var(--accent-dk);
	background: var(--accent-lt);
	border: 1px solid rgba(108, 99, 255, 0.16);
}

.article-card:hover .tag {
	transform: translateX(3px);
}

.article-card:hover .tag {
	background: var(--accent);
	color: #fff;
	border-color: var(--accent);
}

.tag.coral {
	color: var(--coral-dk);
	background: var(--coral-lt);
	border-color: rgba(255, 107, 107, 0.18);
}

.article-card:hover .tag.coral {
	background: var(--coral);
	color: #fff;
	border-color: var(--coral);
}

/* ================================================
       TITLE
    ================================================ */
.card-body h4 {
	font-family: 'Montserrat', sans-serif !important;
	font-size: 1.02rem;
	font-weight: 800;
	line-height: 1.40;
	letter-spacing: -0.02em;
	color: var(--dark) !important;
	margin-bottom: 10px;
	transition: color var(--dur) var(--ease);
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.article-card:hover .card-body h4 {
	color: var(--accent-dk) !important;
}

/* ================================================
       DESCRIPTION
    ================================================ */
.card-body p {
	font-family: 'Source Serif 4', serif !important;
	font-size: 0.88rem;
	color: var(--text-body);
	line-height: 1.70;
	flex: 1;
	margin-bottom: 20px;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

/* ================================================
       CARD FOOTER
    ================================================ */
.card-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-top: 1px solid var(--border-card);
	padding-top: 15px;
	margin-top: auto;
}

.card-date {
	display: flex;
	align-items: center;
	gap: 6px;
	font-family: 'Montserrat', sans-serif;
	font-size: 0.74rem;
	font-weight: 600;
	color: var(--text-muted);
}

.card-date i {
	font-size: 0.70rem;
}

.read-link {
	display: inline-flex;
	align-items: center;
	gap: 7px;
	font-family: 'Montserrat', sans-serif;
	font-size: 0.74rem;
	font-weight: 800;
	color: var(--accent-dk);
	background: var(--accent-lt);
	border: 1px solid rgba(108, 99, 255, 0.16);
	padding: 6px 15px;
	border-radius: 100px;
	transition: background var(--dur) var(--ease), color var(--dur)
		var(--ease), gap var(--dur) var(--ease);
}

.read-link i {
	font-size: 0.66rem;
	transition: transform var(--dur) var(--ease);
}

.article-card:hover .read-link {
	background: var(--accent);
	color: #fff;
	border-color: var(--accent);
	gap: 10px;
}

.article-card:hover .read-link i {
	animation: arrowBounce 0.6s var(--ease) infinite;
}

/* ================================================
       RESPONSIVE
    ================================================ */
@media ( max-width : 1024px) {
	.articles-grid {
		grid-template-columns: repeat(2, 1fr);
		gap: 22px;
	}
	.article-card.featured {
		grid-column: span 2;
	}
	.section-header {
		flex-direction: column;
		align-items: flex-start;
		gap: 14px;
	}
}

@media ( max-width : 680px) {
	.page-wrapper {
		padding-top: 64px;
		padding-bottom: 80px;
	}
	.hero {
		padding: 48px 16px 44px;
	}
	.hero h1 {
		font-size: 2rem;
	}
	.hero-desc {
		font-size: 0.92rem;
	}
	.hero-pills {
		gap: 8px;
	}
	.hero-pill {
		font-size: 0.70rem;
		padding: 6px 13px;
	}
	.container {
		padding: 40px 14px 0;
	}
	.articles-grid {
		grid-template-columns: 1fr;
		gap: 18px;
	}

	/* featured collapses on mobile */
	.article-card.featured {
		grid-column: span 1;
		flex-direction: column;
	}
	.article-card.featured .card-img-wrap {
		width: 100%;
		min-height: unset;
		height: 220px;
		border-right: none;
		border-bottom: 1px solid var(--border-card);
	}
	.article-card.featured .card-body {
		padding: 22px 18px;
	}

	/* all image heights on mobile */
	.card-img-wrap, .article-card:nth-child(1) .card-img-wrap, .article-card:nth-child(2) .card-img-wrap,
		.article-card:nth-child(3) .card-img-wrap, .article-card:nth-child(4) .card-img-wrap,
		.article-card:nth-child(5) .card-img-wrap, .article-card:nth-child(6) .card-img-wrap
		{
		height: 200px;
	}
	.card-body {
		padding: 18px 16px 14px;
	}
	.card-body h4 {
		font-size: 0.95rem;
	}
	.card-body p {
		font-size: 0.84rem;
	}
	.section-header-right {
		display: none;
	}
}

@media ( prefers-reduced-motion : reduce) {
	*, *::before, *::after {
		animation-duration: 0.01ms !important;
		transition-duration: 0.01ms !important;
	}
}
</style>
</head>
<body>

<jsp:include page="../includes/navbar/navbar.jsp" /> 
 <div class="page-wrapper">

        <!-- ============================================================
             HERO — SIMPLE & CLEAN
        ============================================================ -->
        <div class="hero">
            <div class="hero-eyebrow">
                <i class="fas fa-newspaper"></i> IARDO KNOWLEDGE HUB
            </div>

            <h1>Articles &amp; <em>Insights</em></h1>

            <p class="hero-desc">
                Tips, trends, and stories curated for you. Stay ahead with the
                latest in tech, business, design, and marketing.
            </p>

            <div class="hero-pills">
                <span class="hero-pill"><i class="fas fa-chart-line"></i> Business</span>
                <span class="hero-pill"><i class="fas fa-box-open"></i> Seller Tips</span>
                <span class="hero-pill"><i class="fas fa-store"></i> E-Commerce</span>
                <span class="hero-pill"><i class="fas fa-hashtag"></i> Social Media</span>
                <span class="hero-pill"><i class="fas fa-robot"></i> AI &amp; Marketing</span>
                <span class="hero-pill"><i class="fas fa-bolt"></i> Quick Commerce</span>
            </div>
        </div>

        <!-- ============================================================
             ARTICLES
        ============================================================ -->
        <div class="container">

            <div class="section-header">
                <div class="section-header-left">
                    <h3>Recent Articles</h3>
                    <p>Hand-picked guides, strategies and insights for sellers &amp; marketers</p>
                    <span class="section-title-line"></span>
                </div>
                <div class="section-header-right">
                    <i class="fas fa-fire"></i> Fresh &amp; Trending
                </div>
            </div>


<div class="articles-grid">
    <c:forEach var="b" items="${blogs}" varStatus="loop">
         <a href="${pageContext.request.contextPath}/blog/${b.slug}" class="article-card">
            <div class="card-img-wrap">
                <img src="${b.featuredImage}" alt="${fn:escapeXml(b.title)}">
            </div>
            <div class="card-body">
               <span class="tag">
                    ${b.category}
                </span> 
                <h4>${b.title}</h4>
                <p>${b.shortDescription}</p>
                <div class="card-footer">
                    <span class="card-date">
                        <i class="far fa-calendar-alt"></i> ${b.publishedDate}
                    </span>                    <span class="read-link">
                        Read <i class="fas fa-arrow-right"></i>
                    </span>
                </div>
            </div>
        </a>
    </c:forEach>
</div>



        </div><!-- /.container -->
    </div><!-- /.page-wrapper -->

 <jsp:include page="../includes/footer/footer.jsp" />

	<script>
		// Scroll-reveal for cards below the fold
		(function() {
			if (!('IntersectionObserver' in window))
				return;
			var cards = document.querySelectorAll('.article-card');
			var io = new IntersectionObserver(function(entries) {
				entries.forEach(function(e) {
					if (e.isIntersecting) {
						e.target.style.opacity = '1';
						e.target.style.transform = 'translateY(0)';
						io.unobserve(e.target);
					}
				});
			}, {
				threshold : 0.10
			});
			cards
					.forEach(function(c) {
						c.style.opacity = '0';
						c.style.transform = 'translateY(26px)';
						c.style.transition = 'opacity 0.52s ease, transform 0.52s ease';
						io.observe(c);
					});
		})();
	</script>

</body>
</html>
