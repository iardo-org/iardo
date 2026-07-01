<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Our Culture – Growth-Driven & Result-Oriented | IARDO</title>
<link rel="stylesheet" href="./style.css">
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="icon" type="image/webp"
	href="https://iardo.pages.dev/logo_iardo_wbg.webp">
<link rel="apple-touch-icon"
	href="https://iardo.pages.dev/logo_iardo_wbg.webp">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&family=Source+Serif+4:ital,wght@0,300;0,400;0,500;1,400&display=swap"
	rel="stylesheet">
</head>

<body>

	<!-- Noise texture overlay for depth -->
	<div class="noise-layer" aria-hidden="true"></div>

	<jsp:include page="../includes/navbar/navbar.jsp" />

	<!-- ═══════════════════════ HERO ═══════════════════════ -->
	<div class="hero">
		<div class="particles" aria-hidden="true">
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
		</div>
		<div class="hero-content">
			<div class="hero-badge">Our Culture</div>
			<h1>
				A culture built on growth,<br>innovation &amp; performance
			</h1>
			<p>At IARDO, we are a result-driven ecommerce growth company
				focused on helping businesses scale across multiple platforms with
				effective strategies, fast execution, and real outcomes.</p>
		</div>
	</div>

	<!-- ═══════════════════════ STATS STRIP ═══════════════════════ -->
	<div class="stats-strip">
		<div class="stat-item">
			<span class="stat-num" data-target="500">0</span> <span
				class="stat-label">Brands Onboarded</span>
		</div>
		<div class="stat-item">
			<span class="stat-num" data-target="10">0</span> <span
				class="stat-label">Platforms Covered</span>
		</div>
		<div class="stat-item">
			<span class="stat-num" data-target="98">0</span> <span
				class="stat-label">% Client Satisfaction</span>
		</div>
		<div class="stat-item">
			<span class="stat-num" data-target="10">0</span> <span
				class="stat-label">Years of Excellence</span>
		</div>
	</div>

	<!-- ═══════════════════════ PURPOSE / MISSION / VISION ═══════════════════════ -->
	<section class="reveal">
		<div class="section-title">
			<h2>What drives us</h2>
			<p>The foundation on which every decision at IARDO is built</p>
		</div>
		<div class="triple-grid">
			<div class="triple-card">
				<div class="card-num">01</div>
				<h3>Our Purpose</h3>
				<p>To deliver real business outcomes — not just services —
					through smart ecommerce and digital growth strategies that move the
					needle.</p>
			</div>
			<div class="triple-card">
				<div class="card-num">02</div>
				<h3>Our Mission</h3>
				<p>To help businesses with fast onboarding, consistent sales
					growth, and scalable results across every platform that matters.</p>
			</div>
			<div class="triple-card">
				<div class="card-num">03</div>
				<h3>Our Vision</h3>
				<p>To become a globally trusted digital growth services provider
					for ecommerce, quick commerce, and digital platforms worldwide.</p>
			</div>
		</div>
	</section>

	<!-- ═══════════════════════ VALUES ═══════════════════════ -->
	<section class="reveal">
		<div class="section-title">
			<h2>What defines our culture</h2>
			<p>The principles that drive everything we do at IARDO</p>
		</div>
		<div class="values-grid">
			<div class="value-card">
				<span>WE HAVE A</span>
				<h3>Growth Mindset</h3>
			</div>
			<div class="value-card">
				<span>WE DELIVER</span>
				<h3>Results</h3>
			</div>
			<div class="value-card">
				<span>WE ENSURE</span>
				<h3>Fast Execution</h3>
			</div>
			<div class="value-card">
				<span>WE FOLLOW A</span>
				<h3>Client-First Approach</h3>
			</div>
			<div class="value-card">
				<span>WE BELIEVE IN</span>
				<h3>Continuous Learning</h3>
			</div>
			<div class="value-card">
				<span>WE BRING</span>
				<h3>Multi-Platform Expertise</h3>
			</div>
		</div>
	</section>

	<!-- ═══════════════════════ CULTURE DESCRIPTION ═══════════════════════ -->
	<section class="reveal">
		<div class="section-title">
			<h2>How we work at IARDO</h2>
			<p>Our approach to growth, clients, and each other</p>
		</div>
		<div class="culture-text">
			<p>At IARDO, our culture is built around growth, innovation, and
				performance. As a result-driven ecommerce growth company and
				marketplace onboarding experts, we focus on helping businesses scale
				across multiple platforms with effective strategies and execution.</p>
			<p>We believe in delivering real business outcomes, not just
				services. Our team works with a performance-focused mindset where
				every project is aimed at increasing sales, improving visibility,
				and driving long-term success through our digital growth services.</p>
			<p>Our work culture promotes continuous learning, adaptability,
				and staying updated with the latest ecommerce and digital trends.
				This enables us to deliver efficient solutions across marketplaces,
				quick commerce platforms, and digital channels.</p>
			<p>We follow a strong client-first approach, where transparency,
				communication, and long-term partnerships are our priority. At
				IARDO, we don't just onboard businesses — we help them grow, scale,
				and succeed consistently.</p>
		</div>
	</section>

	<jsp:include page="../includes/footer/footer.jsp" />
	<script src="./app.js"></script>
</body>
</html>
