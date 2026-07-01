<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.time.Year"%>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sustainability – Sustainable Business Growth &
	Responsible Scaling | IARDO</title>
<link rel="icon" type="image/webp"
	href="https://iardo.pages.dev/logo_iardo_wbg.webp">
<link rel="apple-touch-icon"
	href="https://iardo.pages.dev/logo_iardo_wbg.webp">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700;800;900&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<link rel="stylesheet" href="./style.css" />
</head>
<body>
	<jsp:include page="../includes/navbar/navbar.jsp" />

	<%
	/* ── Java data ─────────────────────────────── */
	int currentYear = Year.now().getValue();
	int reportYear = currentYear - 1;

	/* Pillar data */
	String[][] pillars = {{"fa-leaf", "E", "Ecommerce Growth",
			"We embed sustainable ecommerce growth into every strategy — from marketplace onboarding and digital channel expansion to performance-driven execution. Every action counts toward building a future-ready business.",
			"Marketplace Scaling", "Digital Channels", "Quick Commerce"},
			{"fa-people-group", "S", "Smart Scaling",
			"Our clients, partners and brands are at the heart of everything we do. We invest in long-term business scaling, optimized processes and performance-driven strategies to create lasting growth across every marketplace we operate in.",
			"Long-Term Growth", "Brand Scaling", "Performance"},
			{"fa-scale-balanced", "G", "Responsible Growth",
			"Transparent, strategic and accountable growth underpins our entire organization. From advanced digital growth services and continuous optimization to full ecommerce management, we hold ourselves to the highest standards.",
			"Ecommerce Strategy", "Optimization", "Accountability"},};

	/* Initiatives (Fixed Image URLs) */
	String[][] initiatives = {{"featured",
			"https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=900&auto=format&fit=crop", "Business Growth",
			"Sustainable Business Growth by 2035",
			"Our most ambitious target yet — a full transition to scalable ecommerce strategies, sustainable marketplace growth and digital channel expansion targeting 1 million brand milestones by 2030."},
			{"", "https://images.unsplash.com/photo-1556761175-5973dc0f32e7?w=600&auto=format&fit=crop", "Quick Commerce",
			"Quick Commerce Platform Growth",
			"Brand-led quick commerce expansion drives across 14 countries, 240,000 orders and counting."},
			{"", "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=600&auto=format&fit=crop",
			"Digital Foundation", "Future-Ready Business Models",
			"All brand operations are optimized, streamlined and built for continuous expansion. Zero inefficiency since 2022."},
			{"", "https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=600&auto=format&fit=crop",
			"People & Brands", "Brand Growth & Wellbeing Programme",
			"Inclusive brand onboarding, strategic mentoring and global ecommerce support driving a 94% client satisfaction score."},
			{"", "https://images.unsplash.com/photo-1552664730-d307ca884978?w=600&auto=format&fit=crop",
			"Marketplace Onboarding", "Expert Marketplace Onboarding",
			"All major ecommerce marketplace onboarding managed end-to-end with 100% certified expertise."},};

	/* Impact stats */
	Object[][] impacts = {{"fa-wind", "68", "%", "Marketplace Coverage", "of total ecommerce platforms"},
			{"fa-tree", "240", "K", "Orders Managed", "across 14 countries"},
			{"fa-recycle", "92", "%", "Client Retention", "sustained long-term partnerships"},
			{"fa-earth-americas", "30", "%", "Revenue Growth", "vs " + (currentYear - 3) + " baseline"},};

	/* Commitment steps */
	String[][] steps = {{"2025", "Digital Growth Measurement & Reporting",
			"Full Scope 1, 2 and 3 ecommerce performance inventory published annually with third-party verification."},
			{"2027", "50% Marketplace Expansion",
			"Science-based scaling targets aligned with ecommerce growth trends — doubling our marketplace footprint from "
					+ (currentYear - 2) + " levels."},
			{"2030", "Net-Zero Inefficiency Operations",
			"100% optimized ecommerce operations, fully streamlined supply chain and all residual inefficiencies resolved through verified strategies."},
			{"2035", "Growth Positive",
			"Generating more value than we consume — investing in brand-based solutions and next-gen ecommerce growth models."},};
	%>

	<div class="cur-dot"></div>
	<div class="cur-ring"></div>

	<section class="hero" id="home">
		<div class="hero-leaves" id="leavesContainer"></div>
		<div class="hero-img-overlay"></div>
		<div class="hero-mesh"></div>

		<div class="hero-content">
			<div class="hero-badge">
				<div class="badge-dot"></div>
				Sustainability Report
				<%=reportYear%>
			</div>

			<h1 class="hero-title">
				Our Commitment to<br /> <span class="hero-title-em">Sustainable</span>
				<span class="hero-title-gold">Business Growth</span>
			</h1>

			<p class="hero-sub">Sustainable business growth isn't a checkbox
				— it's the core of how we scale, operate and expand. Every decision
				we make is shaped by our commitment to responsible scaling,
				long-term success and digital excellence.</p>

			<div class="hero-btns">
				<a href="#pillars" class="btn-green"> <i
					class="fa-solid fa-arrow-down"></i> Explore Our Approach
				</a> <a href="#initiatives" class="btn-outline-green"> <i
					class="fa-solid fa-play" style="font-size: .7rem;"></i> View
					Initiatives
				</a>
			</div>
		</div>

		<div class="hero-stats"></div>

		<div class="hero-scroll-ind">
			<div class="scroll-line"></div>
			<span class="scroll-txt">Scroll</span>
		</div>
	</section>

	<section class="mission" id="mission">
		<div class="container">
			<div class="mission-grid">
				<div class="mission-img-stack reveal-l">
					<div class="mission-img-main">
						<img
							src="https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=900&auto=format&fit=crop"
							alt="IARDO Sustainable Ecommerce Growth" />
					</div>
					<div class="mission-img-float">
						<img
							src="https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=400&auto=format&fit=crop"
							alt="Responsible Business Scaling" />
					</div>
					<div class="mission-badge">
						<span class="mission-badge-num">100%</span> <span
							class="mission-badge-txt">Committed</span>
					</div>
				</div>

				<div class="mission-text reveal-r d2">
					<div class="eyebrow">
						<div class="eyebrow-bar"></div>
						Our Mission
					</div>
					<h2 class="sec-title">
						Scaling brands sustainably,<br />
						<span style="color: var(--sage);">growing for the long run</span>
					</h2>
					<p class="sec-body" style="margin-top: 20px;">At IARDO, we
						focus on sustainable business growth by helping brands scale
						efficiently across ecommerce marketplaces, quick commerce
						platforms, and digital channels. As an experienced ecommerce
						growth company and marketplace onboarding experts, we ensure
						long-term success through smart strategies and execution.</p>
					<p class="sec-body" style="margin-top: 14px;">Our approach is
						built around long term business scaling, where we prioritize
						consistent growth, optimized processes, and performance-driven
						results instead of short-term gains. We help businesses build a
						strong digital foundation that supports continuous expansion and
						stability.</p>

					<div class="mission-stats">
						<div class="m-stat">
							<span class="m-stat-num" data-count="12">0</span> <span
								class="m-stat-lbl">Years Operating</span>
						</div>
						<div class="m-stat">
							<span class="m-stat-num" data-count="47">0</span> <span
								class="m-stat-lbl">Growth Initiatives</span>
						</div>
						<div class="m-stat">
							<span class="m-stat-num" data-count="28">0</span> <span
								class="m-stat-lbl">Countries Active</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="divider"></div>

	<section class="pillars" id="pillars">
		<div class="container">
			<div class="pillars-hdr reveal">
				<div class="eyebrow">
					<div class="eyebrow-bar"></div>
					What We Stand For
				</div>
				<h2 class="sec-title" style="margin-bottom: 16px;">
					Our <span style="color: var(--sage);">Growth</span> Pillars
				</h2>
				<p class="sec-body">Three interlocking commitments that shape
					every aspect of how we scale brands, support marketplaces and
					govern our ecommerce operations.</p>
			</div>

			<div class="pillars-grid">
				<%
				int delay = 1;
				for (String[] p : pillars) {
					String icon = p[0];
					String ltr = p[1];
					String title = p[2];
					String body = p[3];
				%>
				<div class="pillar reveal d<%=delay%>">
					<div class="pillar-letter"><%=ltr%></div>
					<div class="pillar-icon">
						<i class="fa-solid <%=icon%>"></i>
					</div>
					<div class="pillar-title"><%=title%></div>
					<p class="pillar-body"><%=body%></p>
					<div class="pillar-tags">
						<%
						for (int t = 4; t < p.length; t++) {
						%>
						<span class="ptag"><%=p[t]%></span>
						<%
						}
						%>
					</div>
				</div>
				<%
				delay++;
				}
				%>
			</div>
		</div>
	</section>

	<div class="divider"></div>

	<section class="impact">
		<div class="container">
			<div class="impact-inner reveal">
				<div class="eyebrow" style="justify-content: center; display: flex;">
					<div class="eyebrow-bar"></div>
					<%=reportYear%>
					Growth Report
				</div>
				<h2 class="sec-title"
					style="text-align: center; margin-bottom: 16px;">
					Numbers that <span style="color: var(--sage);">matter</span>
				</h2>
				<p class="sec-body" style="text-align: center; margin: 0 auto;">
					Concrete metrics, independently verified — our commitment to
					sustainable ecommerce growth in numbers.</p>
			</div>

			<div class="impact-grid">
				<%
				for (Object[] imp : impacts) {
				%>
				<div class="impact-item reveal d1">
					<i class="fa-solid <%=imp[0]%> impact-icon"></i> <span
						class="impact-num" data-count="<%=imp[1]%>">0<span><%=imp[2]%></span></span>
					<div class="impact-lbl"
						style="font-weight: 600; color: var(--text); margin-top: 8px; font-size: .9rem;"><%=imp[3]%></div>
					<div class="impact-lbl"><%=imp[4]%></div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</section>

	<div class="divider" style="margin: 0;"></div>

	<section class="initiatives" id="initiatives">
		<div class="container">
			<div class="reveal">
				<div class="eyebrow">
					<div class="eyebrow-bar"></div>
					In Action
				</div>
				<h2 class="sec-title" style="margin-bottom: 8px;">
					Our Key <span style="color: var(--sage);">Initiatives</span>
				</h2>
				<p class="sec-body" style="max-width: 580px;">From marketplace
					onboarding to quick commerce growth — here's sustainable business
					scaling brought to life.</p>
			</div>

			<div class="init-grid">
				<%
				int iDelay = 1;
				for (String[] init : initiatives) {
					String featured = init[0];
					String imgUrl = init[1];
					String cat = init[2];
					String iTitle = init[3];
					String iDesc = init[4];
				%>
				<div class="init-card <%=featured%> reveal d<%=iDelay%>">
					<div class="init-img">
						<img src="<%=imgUrl%>" alt="<%=iTitle%>" />
					</div>
					<div class="init-body">
						<div class="init-cat">
							<i class="fa-solid fa-circle"></i>
							<%=cat%>
						</div>
						<div class="init-title"><%=iTitle%></div>
						<p class="init-desc"><%=iDesc%></p>
					</div>
				</div>
				<%
				if (iDelay < 5)
					iDelay++;
				else
					iDelay = 1;
				%>
				<%
				}
				%>
			</div>
		</div>
	</section>

	<div class="divider"></div>

	<section class="commitment" id="commitment">
		<div class="container">
			<div class="commit-grid">
				<div class="commit-visuals reveal-l">
					<div class="commit-img-main">
						<img
							src="https://images.unsplash.com/photo-1473773508845-188df298d2d1?w=800&auto=format&fit=crop"
							alt="Sustainable Ecommerce Growth Roadmap" />
					</div>
					<div class="commit-cards">
						<div class="commit-mini-card">
							<div class="commit-mini-icon">
								<i class="fa-solid fa-certificate"></i>
							</div>
							<div>
								<div class="commit-mini-title">ISO 14001</div>
								<div class="commit-mini-val">Certified</div>
							</div>
						</div>
						<div class="commit-mini-card">
							<div class="commit-mini-icon">
								<i class="fa-solid fa-solar-panel"></i>
							</div>
							<div>
								<div class="commit-mini-title">Marketplaces</div>
								<div class="commit-mini-val">68% Coverage</div>
							</div>
						</div>
						<div class="commit-mini-card">
							<div class="commit-mini-icon">
								<i class="fa-brands fa-pagelines"></i>
							</div>
							<div>
								<div class="commit-mini-title">Orders</div>
								<div class="commit-mini-val">240K Managed</div>
							</div>
						</div>
					</div>
				</div>

				<div class="commit-text reveal-r d2">
					<div class="eyebrow">
						<div class="eyebrow-bar"></div>
						Our Roadmap
					</div>
					<h2 class="sec-title">
						Our path to <span style="color: var(--sage);">Responsible
							Scaling</span>
					</h2>
					<p class="sec-body" style="margin-top: 20px; margin-bottom: 8px;">
						Through our advanced digital growth services, we enable brands to
						improve operations, increase efficiency, and maximize their
						performance across multiple platforms. From onboarding to sales
						growth, we focus on creating scalable and future-ready business
						models.</p>

					<div class="commit-steps">
						<%
						for (String[] step : steps) {
						%>
						<div class="commit-step">
							<div class="step-dot"></div>
							<div class="step-body">
								<h4><%=step[0]%>
									—
									<%=step[1]%></h4>
								<p><%=step[2]%></p>
							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</section>


	<div class="divider"></div>

	<section class="cta-band" id="contact">
		<div class="cta-box reveal">
			<h2 class="cta-title">
				Join us in building<br />
				<span style="color: var(--sage);">a sustainable business
					tomorrow</span>
			</h2>
			<p class="cta-sub">Whether you're a brand, investor, partner or
				marketplace — there's a role for everyone in this growth story. At
				IARDO, sustainability means building businesses that grow steadily,
				operate efficiently, and succeed in the long run with the right
				strategy and support.</p>
		</div>
	</section>

	<jsp:include page="../includes/footer/footer.jsp" />

	<script src="./app.js"></script>
</body>
</html>
