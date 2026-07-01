<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IARDO - Digital Marketing Agency</title>

<!-- Font Awesome (required for navbar scroll-to-top icon) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link rel="icon" type="image/webp"
	href="https://iardo.pages.dev/logo_iardo_wbg.webp">
<link rel="apple-touch-icon"
	href="https://iardo.pages.dev/logo_iardo_wbg.webp">

<link rel="stylesheet" href="./style.css">
</head>
<body>
	<jsp:include page="../includes/navbar/navbar.jsp" />
	<!-- Hero Section -->
	<section id="home" class="hero-section"
		style="min-height: unset !important; height: auto !important; padding-top: 75px; padding-bottom: 25px;">
		<div class="hero-content">
			<h1>
				Hey There! Welcome to<br> <span class="highlight">IARDO</span>
			</h1>
		</div>
	</section>

	<!-- About Section -->
	<section id="about" class="about-section">
		<div class="about-container">
			<div class="about-header">
				<span class="section-label">WHO WE ARE</span>

			</div>

			<div class="about-content">

				<section class="hero reveal">
					<div class="hero-img reveal">
						<img src="https://iardo.pages.dev/chairman.webp"
							alt="Chairman of IARDO" style="max-width: 100%; height: auto;">
					</div>
					<div>
						<h1>About Our Chairman</h1>
						<h2>Leadership &amp; Vision Behind IARDO</h2>
						<p>Our Chairman is the driving force behind IARDO's vision,
							growth, and success. With a strong understanding of digital
							business, ecommerce, and marketplace ecosystems, he has guided
							the company towards becoming a trusted name in seller onboarding
							services, digital transformation, and business growth solutions.
						</p>
						<p>With years of experience in building and scaling
							businesses, our Chairman believes in innovation, performance, and
							long-term growth strategies. His leadership focuses on helping
							businesses succeed across ecommerce marketplaces, quick commerce
							platforms, and digital channels.</p>
						<p>Under his guidance, IARDO has grown into a result-driven
							ecommerce growth company and marketplace onboarding experts,
							delivering impactful solutions that help businesses scale
							efficiently.</p>
						<p>He strongly believes in empowering brands with the right
							tools, strategies, and technology to achieve sustainable growth
							and success in the digital era.</p>
					</div>
				</section>

				<!-- LEADERSHIP HIGHLIGHTS -->
				<section class="section reveal">
					<h3>🌟 Leadership Highlights</h3>
					<h4>💡 Vision &amp; Approach</h4>
					<ul>
						<li>🚀 Focus on business growth &amp; scalability</li>
						<li>📈 Result-driven strategies</li>
						<li>🌐 Strong digital &amp; ecommerce expertise</li>
						<li>⚡ Innovation &amp; performance mindset</li>
						<li>🤝 Client-first leadership</li>
					</ul>
				</section>

				<!-- CHAIRMAN'S MESSAGE -->
				<section class="section reveal">
					<h3>💬 Chairman's Message</h3>
					<blockquote>
						<p>"At IARDO, our mission is to help businesses grow, scale,
							and succeed in the digital world. We believe in delivering real
							results through strategy, innovation, and execution."</p>
					</blockquote>
				</section>

			</div>
		</div>
	</section>


	<!-- FAQ Section -->
	<section class="faq-section">
		<div class="faq-container">
			<div class="faq-header">
				<span class="section-label">FREQUENTLY ASKED QUESTIONS</span>
				<h2>
					Got Questions?<br>We've Got Answers!
				</h2>
			</div>

			<div class="faq-list">
				<div class="faq-item">
					<div class="faq-question">
						<span>What is SEO and why is it important?</span>
						<button class="faq-btn">∨</button>
					</div>
					<div class="faq-answer">
						<p>SEO (Search Engine Optimization) helps your website rank
							higher in search results, increasing visibility and organic
							traffic to your business.</p>
					</div>
				</div>

				<div class="faq-item">
					<div class="faq-question">
						<span>How long does it take to see results from SEO?</span>
						<button class="faq-btn">∨</button>
					</div>
					<div class="faq-answer">
						<p>Typically, you can start seeing SEO results within 3-6
							months, though this varies based on competition and strategy.</p>
					</div>
				</div>

				<div class="faq-item">
					<div class="faq-question">
						<span>How much does SEO cost?</span>
						<button class="faq-btn">∨</button>
					</div>
					<div class="faq-answer">
						<p>SEO costs vary based on your business needs, competition,
							and goals. We offer customized packages to fit different budgets.</p>
					</div>
				</div>

				<div class="faq-item">
					<div class="faq-question">
						<span>What are the key factors that influence SEO rankings?</span>
						<button class="faq-btn">∨</button>
					</div>
					<div class="faq-answer">
						<p>Key factors include quality content, backlinks, site speed,
							mobile-friendliness, user experience, and technical optimization.</p>
					</div>
				</div>
			</div>
		</div>
	</section>



	<%-- DO NOT include navbar.js — navbar.jsp already has all JS inline  --%>
	<jsp:include page="../includes/footer/footer.jsp" />
	<script src="./app.js"></script>

</body>
</html>
