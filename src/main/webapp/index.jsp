<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <title>IARDO · Onboarding</title>
  
  <!-- Fonts for Navbar & Footer -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Montserrat:wght@400;600;700;800;900&family=Source+Serif+4:ital,wght@0,400;0,600;1,400&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  
  <style>
    /* =====================================================
    NAVBAR CSS (from first file - merged)
    ===================================================== */
    :root {
      --bg-light: #ffffff;
      --bg-light-2: #f8f9fa;
      --bg-glass: rgba(255, 255, 255, 0.85);
      --primary: #ff6b35;
      --primary-light: #ff8c61;
      --secondary: #ffb703;
      --text-dark: #111827;
      --text-gray: #4b5563;
      --text-muted: #6b7280;
      --border-glass: rgba(0, 0, 0, 0.08);
      --shadow-soft: 0 10px 40px rgba(0, 0, 0, 0.05);
    }

    /* ── RESET & BASE ── */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    html {
      scroll-behavior: smooth;
    }
    body {
      background: #ffffff;
      color: #ffffff;
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
      overflow-x: hidden;
    }
    body.menu-open {
      overflow: hidden;
    }

    .container {
      margin: 0 auto;
      padding: 0 20px;
    }

    /* ── NAVBAR BASE ── */
    .navbar {
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 1000;
      padding: 10px 0;
      background: transparent;
      transition: all 0.3s ease;
    }
    .navbar.scrolled {
      backdrop-filter: blur(18px);
      -webkit-backdrop-filter: blur(18px);
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
      background: rgba(255, 255, 255, 0.9);
    }
    .nav-glass {
      padding: 10px 20px;
      border-radius: 50px;
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      border: 1px solid rgba(0, 0, 0, 0.06);
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.06);
      overflow: visible;
    }
    .navbar .nav-wrapper {
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
      position: relative !important;
      flex-direction: row !important;
      flex-wrap: nowrap !important;
    }

    /* ── LOGO ── */
    .logo .logo-img {
      height: 120px;
      width: auto;
      background: transparent;
      filter: drop-shadow(0 2px 5px rgba(0, 0, 0, 0.1));
    }
    .logo:hover .logo-img {
      filter: drop-shadow(0 4px 10px rgba(0, 0, 0, 0.15));
      transform: scale(1.05);
    }

    /* ── NAV MENU ── */
    .nav-menu {
      list-style: none;
      display: flex;
      gap: 12px;
      margin: 0;
      padding: 0;
    }
    .nav-menu > li {
      position: relative;
    }
    .nav-menu > li > a {
      padding: 12px 22px;
      border-radius: 40px;
      color: #ffffff;
      text-decoration: none;
      font-size: 0.85rem;
      font-weight: 600;
      letter-spacing: 0.5px;
      transition: all 0.3s ease;
      white-space: nowrap;
      display: block;
      cursor: pointer;
    }
    .navbar.scrolled .nav-menu > li > a {
      color: #111827;
    }
    .nav-menu > li > a:hover {
      background: rgba(255, 255, 255, 0.15);
      color: var(--secondary);
    }
    .navbar.scrolled .nav-menu > li > a:hover {
      background: rgba(0, 0, 0, 0.05);
      color: var(--primary);
    }
    .nav-menu > li > a.active {
      background: linear-gradient(135deg, var(--primary), var(--secondary));
      color: #fff;
    }

    /* ── DROPDOWN MENU ── */
    .dropdown-menu {
      position: absolute;
      top: 100%;
      left: 50%;
      transform: translateX(-50%);
      background: rgba(255, 255, 255, 0.98);
      backdrop-filter: blur(30px);
      -webkit-backdrop-filter: blur(30px);
      border: 1px solid rgba(0, 0, 0, 0.08);
      border-radius: 20px;
      padding: 15px 0;
      margin-top: 15px;
      min-width: 220px;
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
      opacity: 0;
      visibility: hidden;
      transform: translateX(-50%) translateY(-10px);
      transition: all 0.3s ease;
      list-style: none;
      z-index: 1001;
    }
    .nav-menu > li:hover .dropdown-menu {
      opacity: 1;
      visibility: visible;
      transform: translateX(-50%) translateY(0);
    }
    .dropdown-menu > li > a {
      padding: 12px 25px;
      color: var(--text-gray);
      font-size: 0.9rem;
      font-weight: 500;
      border-radius: 0;
      display: flex;
      align-items: center;
      justify-content: space-between;
      text-decoration: none;
      white-space: nowrap;
    }
    .dropdown-menu > li > a:hover {
      background: rgba(0, 0, 0, 0.03);
      color: var(--primary);
    }

    /* ── SUB DROPDOWN ── */
    .sub-dropdown {
      position: relative;
    }
    .sub-menu {
      position: absolute;
      left: 100%;
      top: 0;
      background: rgba(255, 255, 255, 0.98);
      backdrop-filter: blur(30px);
      -webkit-backdrop-filter: blur(30px);
      border: 1px solid rgba(0, 0, 0, 0.08);
      border-radius: 20px;
      padding: 15px 0;
      margin-left: 10px;
      min-width: 220px;
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
      opacity: 0;
      visibility: hidden;
      transform: translateX(-10px);
      transition: all 0.3s ease;
      list-style: none;
      z-index: 1002;
    }
    .sub-dropdown:hover .sub-menu {
      opacity: 1;
      visibility: visible;
      transform: translateX(0);
    }
    .sub-menu li a {
      padding: 10px 25px;
      color: var(--text-gray);
      font-size: 0.85rem;
      border-radius: 0;
      display: block;
      text-decoration: none;
      white-space: nowrap;
    }
    .sub-menu li a:hover {
      background: rgba(255, 107, 53, 0.08);
      color: var(--primary);
    }

    /* ── MEGA MENU ── */
    .mega-menu {
      position: fixed;
      top: auto;
      left: auto;
      right: auto;
      background: rgba(255, 255, 255, 0.98);
      backdrop-filter: blur(30px);
      -webkit-backdrop-filter: blur(30px);
      border: 1px solid rgba(0, 0, 0, 0.08);
      border-radius: 20px;
      padding: 40px 30px;
      width: 900px;
      max-width: calc(100vw - 40px);
      box-shadow: 0 20px 50px rgba(0, 0, 0, 0.12);
      opacity: 0;
      visibility: hidden;
      transform: translateY(-10px);
      transition: opacity 0.3s ease, visibility 0.3s ease, transform 0.3s ease;
      z-index: 1001;
      overflow: hidden;
    }
    .nav-menu > li:hover .mega-menu {
      opacity: 1;
      visibility: visible;
      transform: translateY(0);
    }
    .mega-menu-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 30px;
    }
    .mega-menu-column {
      display: flex;
      flex-direction: column;
      min-width: 0;
      overflow: hidden;
    }
    .mega-menu-column h3 {
      font-size: 0.8rem;
      font-weight: 700;
      letter-spacing: 1.5px;
      color: var(--primary);
      margin-bottom: 20px;
      text-transform: uppercase;
    }
    .mega-menu-column ul {
      list-style: none;
      padding: 0;
      margin: 0;
      display: flex;
      flex-direction: column;
      gap: 8px;
    }
    .mega-menu-column ul li a {
      display: block;
      padding: 10px 5px;
      color: var(--text-gray);
      text-decoration: none;
      font-size: 0.9rem;
      font-weight: 500;
      border-radius: 8px;
      transition: all 0.3s ease;
      word-wrap: break-word;
      line-height: 1.4;
    }
    .mega-menu-column ul li a:hover {
      background: rgba(255, 107, 53, 0.08);
      padding-left: 20px;
      color: var(--primary);
    }

    /* ── FLASH NOON BUTTON ── */
    .flash-noon-btn {
      font-size: 0.85rem;
      font-weight: 700;
      color: #fff;
      background: linear-gradient(135deg, #ff6b35, #ffb703);
      padding: 10px 18px;
      border-radius: 30px;
      text-decoration: none;
      margin-left: 15px;
      box-shadow: 0 6px 20px rgba(255, 107, 53, 0.35);
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
      display: inline-block;
    }
    .flash-noon-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 10px 30px rgba(255, 107, 53, 0.5);
    }
    .flash-noon-btn::before {
      content: "";
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(120deg, transparent, rgba(255, 255, 255, 0.4), transparent);
      transition: 0.5s;
    }
    .flash-noon-btn:hover::before {
      left: 100%;
    }

    /* ── HAMBURGER ── */
    .hamburger {
      display: none;
      flex-direction: column;
      gap: 5px;
      cursor: pointer;
      z-index: 1100;
      padding: 10px;
      background: none;
      border: none;
      flex-shrink: 0;
    }
    .hamburger span {
      width: 28px;
      height: 3px;
      background: #080e1a;
      border-radius: 3px;
      transition: all 0.3s ease;
      display: block;
    }
    .navbar.scrolled .hamburger span {
      background: #080e1a;
    }
    .hamburger.active span {
      background: #080e1a !important;
    }
    .hamburger.active span:nth-child(1) {
      transform: rotate(45deg) translate(8px, 8px);
    }
    .hamburger.active span:nth-child(2) {
      opacity: 0;
    }
    .hamburger.active span:nth-child(3) {
      transform: rotate(-45deg) translate(8px, -8px);
    }

    /* ── MOBILE MENU ── */
    .mobile-menu {
      position: fixed;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100vh;
      background: rgba(255, 255, 255, 0.98);
      backdrop-filter: blur(30px);
      -webkit-backdrop-filter: blur(30px);
      z-index: 999;
      padding-top: 120px;
      transition: left 0.4s cubic-bezier(0.68, -0.55, 0.27, 1.55);
      overflow-y: auto;
    }
    .mobile-menu.active {
      left: 0;
    }
    .mobile-nav-menu {
      list-style: none;
      padding: 0;
      margin: 0;
      display: flex;
      flex-direction: column;
      gap: 0;
    }
    .mobile-nav-menu > li {
      width: 100%;
      border-bottom: 1px solid rgba(0, 0, 0, 0.05);
    }
    .mobile-nav-menu > li > a {
      display: block;
      padding: 20px 40px;
      color: var(--text-dark);
      text-decoration: none;
      font-size: 1.1rem;
      font-weight: 600;
      letter-spacing: 1px;
      transition: all 0.3s ease;
      cursor: pointer;
    }
    .mobile-nav-menu > li > a:hover {
      background: rgba(0, 0, 0, 0.02);
      padding-left: 50px;
      color: var(--primary);
    }
    .mob-dropdown-menu {
      list-style: none;
      padding: 0;
      margin: 0;
      max-height: 0;
      overflow: hidden;
      background: #f9fafb;
      transition: max-height 0.4s ease;
    }
    .mob-dropdown-menu.open {
      max-height: 3000px;
    }
    .mob-dropdown-menu > li {
      border-bottom: 1px solid rgba(0, 0, 0, 0.03);
    }
    .mob-dropdown-menu > li > a {
      display: block;
      padding: 15px 50px;
      color: var(--text-gray);
      text-decoration: none;
      font-size: 1rem;
      font-weight: 500;
      letter-spacing: 0.5px;
      transition: all 0.3s ease;
      cursor: pointer;
    }
    .mob-dropdown-menu > li > a:hover {
      background: rgba(0, 0, 0, 0.03);
      padding-left: 60px;
      color: var(--text-dark);
    }
    .mob-sub-menu {
      list-style: none;
      padding: 0;
      margin: 0;
      max-height: 0;
      overflow: hidden;
      background: #f3f4f6;
      transition: max-height 0.4s ease;
    }
    .mob-sub-menu.open {
      max-height: 1500px;
    }
    .mob-sub-menu li a {
      display: block;
      padding: 12px 65px;
      color: var(--text-muted);
      text-decoration: none;
      font-size: 0.95rem;
      font-weight: 500;
      transition: all 0.3s ease;
    }
    .mob-sub-menu li a:hover {
      background: rgba(255, 107, 53, 0.05);
      padding-left: 75px;
      color: var(--primary);
    }
    .mob-it-section-title {
      display: block;
      padding: 12px 50px;
      color: var(--primary);
      font-size: 0.8rem;
      font-weight: 700;
      letter-spacing: 1.5px;
      text-transform: uppercase;
      background: rgba(255, 107, 53, 0.05);
      border-bottom: 1px solid rgba(255, 107, 53, 0.1);
      cursor: default;
    }
    .mob-toggle {
      cursor: pointer;
      user-select: none;
      position: relative;
    }
    .mob-toggle::after {
      content: '▸';
      margin-left: 8px;
      font-size: 0.85em;
      transition: transform 0.3s ease;
      display: inline-block;
    }
    .mob-toggle.open::after {
      transform: rotate(90deg);
    }

    /* ── RESPONSIVE NAVBAR ── */
    @media (max-width: 1385px) {
      .nav-glass {
        padding: 10px 5px;
        border-radius: 50px;
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        border: 1px solid rgba(0, 0, 0, 0.06);
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.06);
        overflow: visible;
      }
      .logo .logo-img {
        margin-right: 20px;
        height: 100px;
        width: auto;
        background: transparent;
        filter: drop-shadow(0 2px 5px rgba(0, 0, 0, 0.1));
      }
      .nav-menu {
        gap: 0px;
      }
      .nav-menu > li > a {
        padding: 10px 10px;
        border-radius: 30px;
        color: #111;
        font-size: 0.85rem;
        font-weight: 600;
        transition: all 0.25s ease;
      }
      .navbar.scrolled .nav-menu > li > a {
        color: #111;
      }
    }
    @media (max-width: 1150px) {
      .logo .logo-img {
        height: 70px;
        margin-right: 0;
      }
      .navbar .nav-wrapper {
        display: flex !important;
        align-items: center !important;
        justify-content: space-between !important;
        position: relative !important;
        flex-direction: row !important;
        flex-wrap: nowrap !important;
      }
      .navbar {
        background: #ffffff;
        padding: 10px 0;
      }
      .navbar.scrolled {
        background: #ffffff;
      }
      .nav-glass {
        display: none;
      }
      .hamburger {
        display: flex !important;
      }
    }
    @media (max-width: 480px) {
      .logo .logo-img {
        height: 60px;
      }
      .mobile-nav-menu > li > a {
        padding: 18px 30px;
        font-size: 1rem;
      }
      .mob-dropdown-menu > li > a {
        padding: 12px 40px;
        font-size: 0.95rem;
      }
      .mob-sub-menu li a {
        padding: 10px 50px;
        font-size: 0.9rem;
      }
      .mob-it-section-title {
        padding: 10px 40px;
      }
      .flash-noon-btn {
        margin-left: 0;
        margin-top: 10px;
        display: inline-block;
      }
    }

    /* =====================================================
    FOOTER CSS (from second file - merged)
    ===================================================== */
    :root {
      --color-bg: #EAEFEF;
      --color-surface: #BFC9D1;
      --color-dark: #EAEFEF;
      --color-accent: #FF9B51;
      --color-emerald: #003527;
      --color-emerald-mid: #0b513d;
      --color-teal-bg: #e1f5ee;
      --color-gold-start: #cca72f;
      --color-gold-end: #ffffff;
      --color-muted: #707974;
      --color-body: #404944;
    }

    .footer {
      background: #f0e1e1;
      background: linear-gradient(90deg, rgba(240, 225, 225, 1) 50%, rgba(247, 231, 203, 1) 100%);
      color: #c8d0d4;
      font-family: 'Montserrat', sans-serif;
      position: relative;
      overflow: hidden;
      padding-top: 60px;
      margin-top: 0;
    }
    .footer::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      z-index: 2;
    }
    .footer::after {
      content: '';
      position: absolute;
      inset: 0;
      background: radial-gradient(ellipse 55% 50% at 0% 100%, rgba(0, 53, 39, 0.18) 0%, transparent 60%),
        radial-gradient(ellipse 40% 35% at 100% 0%, rgba(255, 155, 81, 0.07) 0%, transparent 55%);
      pointer-events: none;
      z-index: 0;
    }
    .footer .container {
      position: relative;
      z-index: 1;
      max-width: 1280px;
      margin: 0 auto;
      padding: 0 28px;
    }

    .footer-grid {
      display: grid;
      grid-template-columns: repeat(6, 1fr);
      gap: 28px;
      align-items: start;
      padding-bottom: 48px;
    }
    .footer-col h4 {
      font-family: 'Montserrat', sans-serif;
      font-weight: 700;
      font-size: 11px;
      text-transform: uppercase;
      letter-spacing: 0.08em;
      color: #994a05;
      margin: 0 0 18px;
      padding-bottom: 10px;
      position: relative;
    }
    .footer-col h4::after {
      content: '';
      position: absolute;
      left: 0;
      bottom: 0;
      width: 28px;
      height: 2px;
      background: linear-gradient(90deg, var(--color-gold-start), var(--color-gold-end));
      border-radius: 2px;
    }
    .footer-col ul {
      list-style: none;
      padding: 0;
      margin: 0 0 20px;
    }
    .footer-col ul li {
      margin-bottom: 9px;
    }
    .footer-col ul li a {
      font-family: 'Montserrat', sans-serif;
      font-weight: 600;
      font-size: 12px;
      letter-spacing: 0.02em;
      color: black;
      text-decoration: none;
      display: inline-block;
      padding-left: 13px;
      position: relative;
      transition: color 0.2s ease, transform 0.2s ease;
      line-height: 1.5;
    }
    .footer-col ul li a::before {
      content: '▸';
      position: absolute;
      left: 0;
      font-size: 9px;
      color: var(--color-accent);
      top: 2px;
      transition: transform 0.2s ease;
    }
    .footer-col ul li a:hover {
      color: var(--color-accent);
      transform: translateX(4px);
    }
    .footer-col ul li a:hover::before {
      transform: translateX(-2px);
    }

    .footer-logo {
      margin-top: 20px;
    }
    .footer-logo .logo-img {
      max-width: 110px;
      height: auto;
      filter: drop-shadow(0 3px 8px rgba(255, 155, 81, 0.18));
    }

    .social-icons {
      display: flex;
      flex-wrap: wrap;
      gap: 9px;
      margin-top: 18px;
    }
    .social-icon {
      width: 36px;
      height: 36px;
      border-radius: 9px;
      display: flex;
      align-items: center;
      justify-content: center;
      text-decoration: none;
      font-size: 15px;
      color: #fff;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.28);
      transition: transform 0.25s ease, box-shadow 0.25s ease;
    }
    .social-icon:hover {
      transform: translateY(-3px) scale(1.08);
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.38);
    }
    .social-icon.instagram { background: linear-gradient(135deg, #E1306C, #C13584, #833AB4); }
    .social-icon.facebook { background: #1877F2; }
    .social-icon.twitter { background: #1da1f2; }
    .social-icon.youtube { background: #FF0000; }
    .social-icon.linkedin { background: #0077B5; }
    .social-icon.whatsapp { background: #25D366; }

    .footer-bottom {
      border-top: 1px solid rgba(191, 201, 209, 0.12);
      padding: 22px 0;
      position: relative;
      z-index: 1;
    }
    .footer-bottom p {
      font-family: 'Montserrat', sans-serif;
      font-weight: 600;
      font-size: 11px;
      text-transform: uppercase;
      letter-spacing: 0.07em;
      color: var(--color-muted);
      text-align: center;
      margin: 0;
    }
    .footer-bottom a.brand-name {
      color: var(--color-accent);
      text-decoration: none;
      font-weight: 700;
      transition: color 0.2s;
    }
    .footer-bottom a.brand-name:hover {
      color: var(--color-gold-end);
    }

    /* ── RESPONSIVE FOOTER ── */
    @media (max-width: 1200px) {
      .footer-grid {
        grid-template-columns: repeat(3, 1fr);
      }
    }
    @media (max-width: 768px) {
      .footer-grid {
        grid-template-columns: repeat(2, 1fr);
        gap: 20px;
      }
      .footer {
        padding-top: 44px;
      }
    }
    @media (max-width: 480px) {
      .footer-grid {
        grid-template-columns: 1fr;
      }
    }

    /* ── SCROLL TO TOP ── */
    .scroll-top {
      position: fixed;
      bottom: 32px;
      right: 32px;
      width: 48px;
      height: 48px;
      background: var(--color-emerald);
      border: 2px solid rgba(255, 155, 81, 0.35);
      border-radius: 50%;
      color: #fff;
      font-size: 18px;
      cursor: pointer;
      opacity: 0;
      visibility: hidden;
      transform: scale(0.8);
      transition: all 0.35s cubic-bezier(0.22, 1, 0.36, 1);
      box-shadow: 0 6px 20px rgba(0, 53, 39, 0.35);
      z-index: 1000;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .scroll-top.active {
      opacity: 1;
      visibility: visible;
      transform: scale(1);
    }
    .scroll-top:hover {
      background: var(--color-accent);
      border-color: var(--color-gold-end);
      transform: scale(1.1) translateY(-3px);
      box-shadow: 0 10px 28px rgba(255, 155, 81, 0.4);
    }
    .scroll-top:active {
      transform: scale(0.95);
    }
    .scroll-top i {
      font-size: 18px;
    }
    @media (max-width: 768px) {
      .scroll-top {
        bottom: 22px;
        right: 22px;
        width: 42px;
        height: 42px;
      }
    }

    /* =====================================================
    ONBOARDING PAGE STYLES - UPDATED
    ===================================================== */
    /* Preloader */
    #preloader {
      position: fixed;
      inset: 0;
      z-index: 9999;
      background: #ffffff;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      transition: opacity 0.8s ease, visibility 0.8s ease;
      opacity: 1;
      visibility: visible;
      pointer-events: all;
    }
    #preloader.hidden {
      opacity: 0;
      visibility: hidden;
      pointer-events: none;
    }
    #preloader .spinner {
      width: 56px;
      height: 56px;
      border: 3px solid rgba(0,0,0,0.06);
      border-top: 3px solid #ff6b35;
      border-radius: 50%;
      animation: spin 1s cubic-bezier(0.6, 0, 0.4, 1) infinite;
      margin-bottom: 24px;
    }
    #preloader p {
      font-size: 13px;
      letter-spacing: 4px;
      text-transform: uppercase;
      color: #888;
      font-weight: 300;
      margin-top: 8px;
    }
    @keyframes spin {
      to { transform: rotate(360deg); }
    }

    .page-content {
      opacity: 0;
      transition: opacity 0.6s ease;
    }
    .page-content.ready {
      opacity: 1;
    }

    /* Video Hero */
    .hero {
      height: 400vh;
      position: relative;
    }
    .video-wrap {
      position: sticky;
      top: 0;
      height: 100vh;
      width: 100%;
      overflow: hidden;
      background: #ffffff;
    }
    .scroll-video {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
      pointer-events: none;
      filter: brightness(1.1) contrast(1.05);
    }

    .video-info-block {
      padding: 80px 8vw;
      border-top: 1px solid rgba(0, 0, 0, 0.08);
      border-bottom: 1px solid rgba(0, 0, 0, 0.08);
      position: relative;
      z-index: 10;
      overflow: hidden;
      background: #ffffff;
    }
    .video-info-block .info-inner {
      max-width: 1100px;
      margin: 0 auto;
    }
    .video-info-block small {
      letter-spacing: 4px;
      text-transform: uppercase;
      font-size: 12px;
      color: #666;
      display: inline-block;
      border-left: 3px solid #ff6b35;
      padding-left: 14px;
      margin-bottom: 16px;
      opacity: 0;
      transform: translateY(30px);
      transition: all 0.5s cubic-bezier(0.22, 1, 0.36, 1);
    }
    .video-info-block h2 {
      font-size: clamp(28px, 4vw, 52px);
      line-height: 1.1;
      letter-spacing: -1.5px;
      margin-bottom: 16px;
      color: #1a1a2e;
      opacity: 0;
      transform: translateY(30px);
      transition: all 0.5s cubic-bezier(0.22, 1, 0.36, 1);
      transition-delay: 0.08s;
    }
    .video-info-block p {
      max-width: 650px;
      font-size: 17px;
      line-height: 1.7;
      color: #555;
      opacity: 0;
      transform: translateY(30px);
      transition: all 0.5s cubic-bezier(0.22, 1, 0.36, 1);
      transition-delay: 0.16s;
    }
    .video-info-block.visible small,
    .video-info-block.visible h2,
    .video-info-block.visible p {
      opacity: 1;
      transform: translateY(0);
    }

    /* Service Sections - Updated */
    .service-section {
      padding: 60px 8vw 80px;
      position: relative;
    }
    .service-section .section-header {
      max-width: 1100px;
      margin: 0 auto 40px;
    }
    .service-section .section-header small {
      letter-spacing: 4px;
      text-transform: uppercase;
      font-size: 12px;
      display: inline-block;
      border-left: 3px solid currentColor;
      padding-left: 14px;
      margin-bottom: 12px;
      font-weight: 600;
    }
    .service-section .section-header h2 {
      font-size: clamp(28px, 3.5vw, 44px);
      line-height: 1.1;
      letter-spacing: -1.5px;
      margin-bottom: 8px;
      color: inherit;
    }
    .service-section .section-header p {
      max-width: 600px;
      font-size: 16px;
      line-height: 1.7;
      opacity: 0.8;
    }
    .service-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 24px;
      max-width: 1100px;
      margin: 0 auto;
    }
    .service-card {
      background: rgba(255, 255, 255, 0.08);
      backdrop-filter: blur(4px);
      -webkit-backdrop-filter: blur(4px);
      border: 1px solid rgba(255, 255, 255, 0.15);
      padding: 28px 22px 32px;
      border-radius: 16px;
      transition: all 0.35s cubic-bezier(0.22, 1, 0.36, 1);
      position: relative;
      overflow: hidden;
      opacity: 0;
      transform: translateY(30px);
      cursor: pointer;
      text-decoration: none;
      display: block;
      color: inherit;
    }
    .service-card.visible {
      opacity: 1;
      transform: translateY(0);
    }
    .service-card:hover {
      transform: translateY(-6px);
      box-shadow: 0 12px 40px rgba(0,0,0,0.12);
    }
    .service-card .brand-glow {
      position: absolute;
      top: -60px;
      right: -60px;
      width: 160px;
      height: 160px;
      border-radius: 50%;
      opacity: 0.08;
      transition: all 0.5s ease;
      filter: blur(40px);
    }
    .service-card:hover .brand-glow {
      opacity: 0.2;
      transform: scale(1.3);
    }
    .service-card .brand-logo {
      width: 52px;
      height: 52px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 14px;
      border-radius: 14px;
      background: rgba(255, 255, 255, 0.1);
      padding: 8px;
      transition: all 0.3s ease;
      border: 1px solid rgba(255,255,255,0.08);
    }
    .service-card:hover .brand-logo {
      transform: scale(1.05);
      background: rgba(255, 255, 255, 0.18);
    }
    .service-card .brand-logo img {
      width: 100%;
      height: 100%;
      object-fit: contain;
      display: block;
    }
    .service-card .brand-name {
      font-size: 20px;
      font-weight: 700;
      letter-spacing: -0.5px;
      margin-bottom: 4px;
    }
    .service-card .brand-tag {
      font-size: 11px;
      letter-spacing: 2px;
      text-transform: uppercase;
      opacity: 0.6;
      display: block;
      margin-bottom: 10px;
    }
    .service-card .brand-desc {
      font-size: 14px;
      line-height: 1.6;
      opacity: 0.8;
      margin-bottom: 14px;
    }
    .service-card .btn-silver {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 10px 22px;
      background: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: 60px;
      font-size: 12px;
      font-weight: 500;
      letter-spacing: 1.5px;
      text-transform: uppercase;
      text-decoration: none;
      transition: all 0.35s cubic-bezier(0.22, 1, 0.36, 1);
      position: relative;
      overflow: hidden;
      cursor: pointer;
      width: fit-content;
      color: inherit;
    }
    .service-card .btn-silver::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255,255,255,0.15), transparent);
      transition: left 0.6s ease;
    }
    .service-card .btn-silver:hover::before {
      left: 100%;
    }
    .service-card .btn-silver:hover {
      background: rgba(255, 255, 255, 0.2);
      border-color: rgba(255, 255, 255, 0.35);
      transform: scale(1.03);
      box-shadow: 0 4px 25px rgba(0,0,0,0.06);
    }
    .service-card .btn-silver svg {
      width: 16px;
      height: 16px;
      transition: transform 0.3s ease;
    }
    .service-card .btn-silver:hover svg {
      transform: translateX(4px);
    }
    .service-card .card-footer {
      margin-top: 16px;
      padding-top: 14px;
      border-top: 1px solid rgba(255, 255, 255, 0.08);
      display: flex;
      align-items: center;
      justify-content: space-between;
      flex-wrap: wrap;
      gap: 10px;
    }
    .service-card .card-tags {
      display: flex;
      gap: 10px;
      font-size: 10px;
      opacity: 0.6;
      letter-spacing: 1px;
      text-transform: uppercase;
    }
    .service-card .card-tags span {
      display: flex;
      align-items: center;
      gap: 6px;
    }
    .service-card .card-tags .dot {
      width: 4px;
      height: 4px;
      border-radius: 50%;
      background: currentColor;
      opacity: 0.4;
    }

    /* Section 1: E-Commerce - Dark Theme */
    .section-ecommerce {
      background: #0a0a1a;
      color: #ffffff;
    }
    .section-ecommerce .section-header small {
      color: #ff6b35;
      border-left-color: #ff6b35;
    }
    .section-ecommerce .service-card {
      background: rgba(255, 255, 255, 0.05);
      border-color: rgba(255, 255, 255, 0.08);
    }
    .section-ecommerce .service-card:hover {
      background: rgba(255, 255, 255, 0.09);
      border-color: rgba(255, 255, 255, 0.2);
    }
    .section-ecommerce .service-card .brand-logo {
      background: rgba(255, 255, 255, 0.06);
    }
    .section-ecommerce .service-card .btn-silver {
      color: #fff;
      border-color: rgba(255,255,255,0.15);
    }
    .section-ecommerce .service-card .btn-silver:hover {
      background: rgba(255,255,255,0.12);
      border-color: rgba(255,255,255,0.25);
    }

    /* E-Commerce Brand Colors */
    .card-flipkart .brand-name { color: #2874f0; }
    .card-flipkart .brand-glow { background: #2874f0; }
    .card-flipkart:hover { border-color: #2874f0; }
    .card-amazon .brand-name { color: #ff9900; }
    .card-amazon .brand-glow { background: #ff9900; }
    .card-amazon:hover { border-color: #ff9900; }
    .card-meesho .brand-name { color: #ff6f00; }
    .card-meesho .brand-glow { background: #ff6f00; }
    .card-meesho:hover { border-color: #ff6f00; }
    .card-jiomart .brand-name { color: #d32f2f; }
    .card-jiomart .brand-glow { background: #d32f2f; }
    .card-jiomart:hover { border-color: #d32f2f; }
    .card-nykaa .brand-name { color: #e91e63; }
    .card-nykaa .brand-glow { background: #e91e63; }
    .card-nykaa:hover { border-color: #e91e63; }
    .card-myntra .brand-name { color: #ff3f6c; }
    .card-myntra .brand-glow { background: #ff3f6c; }
    .card-myntra:hover { border-color: #ff3f6c; }

    /* Section 2: Quick Commerce - Light Premium */
    .section-quickcommerce {
      background: #f5f0eb;
      color: #1a1a2e;
    }
    .section-quickcommerce .section-header small {
      color: #ff6b35;
      border-left-color: #ff6b35;
    }
    .section-quickcommerce .service-card {
      background: rgba(255, 255, 255, 0.7);
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      border-color: rgba(255, 255, 255, 0.5);
      box-shadow: 0 4px 20px rgba(0,0,0,0.04);
    }
    .section-quickcommerce .service-card:hover {
      background: rgba(255, 255, 255, 0.9);
      box-shadow: 0 12px 40px rgba(0,0,0,0.08);
      border-color: rgba(255, 255, 255, 0.8);
    }
    .section-quickcommerce .service-card .brand-logo {
      background: rgba(0, 0, 0, 0.04);
      border-color: rgba(0,0,0,0.06);
    }
    .section-quickcommerce .service-card .btn-silver {
      color: #1a1a2e;
      border-color: rgba(0,0,0,0.1);
    }
    .section-quickcommerce .service-card .btn-silver:hover {
      background: rgba(0,0,0,0.06);
      border-color: rgba(0,0,0,0.2);
    }

    /* Quick Commerce Brand Colors */
    .card-blinkit .brand-name { color: #f97316; }
    .card-blinkit .brand-glow { background: #f97316; }
    .card-blinkit:hover { border-color: #f97316; }
    .card-swiggy .brand-name { color: #fc8019; }
    .card-swiggy .brand-glow { background: #fc8019; }
    .card-swiggy:hover { border-color: #fc8019; }
    .card-bigbasket .brand-name { color: #3cb043; }
    .card-bigbasket .brand-glow { background: #3cb043; }
    .card-bigbasket:hover { border-color: #3cb043; }
    .card-zepto .brand-name { color: #6c3eb8; }
    .card-zepto .brand-glow { background: #6c3eb8; }
    .card-zepto:hover { border-color: #6c3eb8; }

    /* Section 3: Modern Trade - Warm Premium */
    .section-moderntrade {
      background: #1a1a2e;
      color: #ffffff;
    }
    .section-moderntrade .section-header small {
      color: #ffb703;
      border-left-color: #ffb703;
    }
    .section-moderntrade .service-card {
      background: rgba(255, 255, 255, 0.04);
      border-color: rgba(255, 255, 255, 0.08);
    }
    .section-moderntrade .service-card:hover {
      background: rgba(255, 255, 255, 0.08);
      border-color: rgba(255, 255, 255, 0.18);
    }
    .section-moderntrade .service-card .brand-logo {
      background: rgba(255, 255, 255, 0.05);
    }
    .section-moderntrade .service-card .btn-silver {
      color: #fff;
      border-color: rgba(255,255,255,0.15);
    }
    .section-moderntrade .service-card .btn-silver:hover {
      background: rgba(255,255,255,0.1);
      border-color: rgba(255,255,255,0.25);
    }

    /* Modern Trade Brand Colors */
    .card-dmart .brand-name { color: #e31837; }
    .card-dmart .brand-glow { background: #e31837; }
    .card-dmart:hover { border-color: #e31837; }
    .card-vishal .brand-name { color: #ff6b00; }
    .card-vishal .brand-glow { background: #ff6b00; }
    .card-vishal:hover { border-color: #ff6b00; }

    /* Faster animation for service cards - reduced delay */
    .service-card:nth-child(1) { transition-delay: 0.02s; }
    .service-card:nth-child(2) { transition-delay: 0.04s; }
    .service-card:nth-child(3) { transition-delay: 0.06s; }
    .service-card:nth-child(4) { transition-delay: 0.08s; }
    .service-card:nth-child(5) { transition-delay: 0.10s; }
    .service-card:nth-child(6) { transition-delay: 0.12s; }

    /* CTA */
    .cta {
      min-height: 70vh;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      padding: 8vw;
      background: #080808;
      border-top: 1px solid rgba(255, 255, 255, 0.04);
    }
    .cta h2 {
      font-size: clamp(44px, 8vw, 100px);
      letter-spacing: -4px;
      font-weight: 600;
      background: linear-gradient(135deg, #eee, #888);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      margin: 16px 0;
    }
    .cta p {
      margin: 20px auto 36px;
      max-width: 500px;
      color: #aaa;
      line-height: 1.7;
      font-size: 17px;
    }
    .btn {
      display: inline-block;
      border: 1px solid #fff;
      padding: 16px 44px;
      color: #fff;
      text-decoration: none;
      text-transform: uppercase;
      letter-spacing: 3px;
      font-size: 13px;
      font-weight: 500;
      transition: 0.25s;
      background: rgba(255, 255, 255, 0.02);
      border-radius: 60px;
      -webkit-tap-highlight-color: transparent;
    }
    .btn:hover {
      background: #fff;
      color: #080808;
    }

    .video-end-cta {
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      z-index: 12;
      text-align: center;
      opacity: 0;
      pointer-events: none;
      transition: opacity 0.65s ease, transform 0.65s ease;
      width: min(90%, 560px);
    }
    .video-end-cta.show {
      opacity: 1;
      pointer-events: auto;
    }
    .video-end-cta small {
      display: block;
      color: rgba(255,255,255,.72);
      font-size: 11px;
      letter-spacing: 3px;
      text-transform: uppercase;
      margin-bottom: 14px;
    }
    .video-end-cta h2 {
      font-size: clamp(30px, 4vw, 54px);
      line-height: 1;
      letter-spacing: -2px;
      margin-bottom: 20px;
      text-shadow: 0 3px 25px rgba(0,0,0,.5);
    }
    .video-end-cta .btn {
      box-shadow: 0 12px 35px rgba(0,0,0,.3);
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
    }


    /* Mobile specific */
    @media (max-width: 819px) {
      body {
        background: #ffffff;
      }
      .hero:first-of-type {
        height: 100vh !important;
      }
      .hero:first-of-type .video-wrap {
        position: relative !important;
        height: 100vh !important;
        background: #ffffff;
      }
      .hero:first-of-type .scroll-video {
        object-fit: cover;
        height: 100vh;
        filter: brightness(1.1) contrast(1.05);
      }
      .hero:first-of-type .video-end-cta {
        opacity: 1 !important;
        pointer-events: auto !important;
        bottom: 12vh !important;
        top: auto !important;
        transform: translate(-50%, 0) !important;
      }
      .hero:not(:first-of-type) {
        height: 60vh !important;
        min-height: 350px;
      }
      .hero:not(:first-of-type) .video-wrap {
        position: relative !important;
        height: 60vh !important;
        min-height: 350px;
        background: #ffffff;
      }
      .hero:not(:first-of-type) .scroll-video {
        object-fit: contain !important;
        height: 100% !important;
        width: 100% !important;
        background: #ffffff;
        filter: brightness(1.1) contrast(1.05);
      }
      .hero:not(:first-of-type) .video-end-cta {
        position: relative !important;
        left: auto !important;
        top: auto !important;
        transform: none !important;
        opacity: 1 !important;
        pointer-events: auto !important;
        width: 100% !important;
        padding: 30px 20px 40px !important;
        background: #ffffff !important;
        border-top: 1px solid rgba(0,0,0,0.08) !important;
        border-radius: 0 !important;
        margin: 0 !important;
      }
      .hero:not(:first-of-type) .video-end-cta small {
        color: #888 !important;
      }
      .hero:not(:first-of-type) .video-end-cta h2 {
        font-size: clamp(24px, 6vw, 38px) !important;
        text-shadow: none !important;
        color: #1a1a2e !important;
      }
      .hero:not(:first-of-type) .video-end-cta .btn {
        backdrop-filter: none !important;
        -webkit-backdrop-filter: none !important;
        box-shadow: none !important;
        border-color: rgba(0,0,0,0.2) !important;
        color: #1a1a2e !important;
      }
      .hero:not(:first-of-type) .video-end-cta .btn:hover {
        background: #1a1a2e !important;
        color: #fff !important;
      }
      .hero:not(:first-of-type) .video-end-cta {
        opacity: 1 !important;
        pointer-events: auto !important;
      }
      .video-info-block {
        padding: 50px 6vw;
        background: #ffffff;
      }
      .service-section {
        padding: 40px 6vw 60px;
      }
      .service-grid {
        grid-template-columns: 1fr;
        gap: 16px;
      }
      .service-card {
        padding: 24px 18px 28px;
      }
      .service-card .brand-logo {
        width: 44px;
        height: 44px;
      }
      .service-card .brand-name {
        font-size: 18px;
      }
      .service-card .btn-silver {
        padding: 8px 18px;
        font-size: 11px;
      }
      .service-card .card-footer {
        flex-direction: column;
        align-items: flex-start;
        gap: 12px;
      }
      .section-ecommerce {
        background: #0a0a1a;
      }
      .section-quickcommerce {
        background: #f5f0eb;
      }
      .section-moderntrade {
        background: #1a1a2e;
      }
    }
    @media (min-width: 820px) {
      .video-end-cta {
        opacity: 0;
        pointer-events: none;
      }
      .video-end-cta.show {
        opacity: 1;
        pointer-events: auto;
      }
    }
    @media (max-width: 480px) {
      .hero:first-of-type .video-end-cta {
        bottom: 10vh !important;
      }
      .hero:not(:first-of-type) {
        height: 50vh !important;
        min-height: 280px;
      }
      .hero:not(:first-of-type) .video-wrap {
        height: 50vh !important;
        min-height: 280px;
      }
    }

    /* =====================================================
    INQUIRY SECTION STYLES
    ===================================================== */
.inquiry-section {
    padding: 80px 8vw 100px;
    background: #ffffff;
    border-top: 1px solid rgba(0, 0, 0, 0.06);
    border-bottom: 1px solid rgba(0, 0, 0, 0.06);
}

.inquiry-container {
    max-width: 1100px;
    margin: 0 auto;
}

/* Heading */
.inquiry-heading {
    text-align: center;
    margin-bottom: 50px;
}

.inquiry-badge {
    display: inline-block;
    font-size: 12px;
    font-weight: 600;
    letter-spacing: 3px;
    text-transform: uppercase;
    color: #ff6b35;
    background: rgba(255, 107, 53, 0.10);
    padding: 6px 18px;
    border-radius: 30px;
    margin-bottom: 12px;
}

.inquiry-heading h2 {
    font-size: clamp(32px, 4vw, 48px);
    letter-spacing: -1.5px;
    color: #1a1a2e;
}

.inquiry-heading h2 span {
    color: #ff6b35;
}

.inquiry-heading p {
    font-size: 17px;
    color: #666;
    max-width: 500px;
    margin: 8px auto 0;
    line-height: 1.6;
}

/* Grid */
.inquiry-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 30px;
    align-items: stretch;
}

/* Cards */
.inquiry-card {
    background: #f8f9fa;
    border-radius: 20px;
    padding: 36px 30px 40px;
    transition: all 0.3s ease;
    border: 1px solid rgba(0, 0, 0, 0.05);
    display: flex;
    flex-direction: column;
}

.inquiry-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 12px 40px rgba(0, 0, 0, 0.06);
    border-color: rgba(255, 107, 53, 0.20);
}

.address-card {
    background: linear-gradient(145deg, #f8f9fa, #ffffff);
}

.actions-card {
    background: linear-gradient(145deg, #ffffff, #f8f9fa);
}

.inquiry-icon {
    width: 56px;
    height: 56px;
    border-radius: 16px;
    background: rgba(255, 107, 53, 0.10);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    color: #ff6b35;
    margin-bottom: 18px;
}

.inquiry-card h4 {
    font-size: 18px;
    font-weight: 700;
    color: #1a1a2e;
    margin-bottom: 10px;
}

.inquiry-card p {
    font-size: 15px;
    line-height: 1.7;
    color: #555;
    margin-bottom: 14px;
    flex: 1;
}

/* Address card - landline */
.landline-text {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    magin-bottom: 10px;
    font-size: 16px;
    font-weight: 600;
    color: #1a1a2e;
    padding: 10px 18px;
    background: rgba(255, 107, 53, 0.06);
    border-radius: 10px;
    border: 1px solid rgba(255, 107, 53, 0.10);
    width: fit-content;
}

.landline-text i {
    color: #ff6b35;
}

/* Action buttons */
.inquiry-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin: 6px 0 16px;
}

.btn-inquiry {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    padding: 14px 28px;
    border-radius: 60px;
    font-size: 14px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    border: none;
    cursor: pointer;
    flex: 1;
    min-width: 140px;
}

.btn-call {
    background: #1a1a2e;
    color: #ffffff;
}

.btn-call:hover {
    background: #ff6b35;
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(255, 107, 53, 0.35);
}

.btn-whatsapp {
    background: #25D366;
    color: #ffffff;
}

.btn-whatsapp:hover {
    background: #1ebe5d;
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(37, 211, 102, 0.35);
}

.btn-inquiry i {
    font-size: 18px;
}

.contact-note {
    display: block;
    font-size: 13px;
    color: #888;
    margin-top: 4px;
    letter-spacing: 0.5px;
}

/* =====================================================
    RESPONSIVE INQUIRY
    ===================================================== */
@media (max-width: 768px) {
    .inquiry-section {
        padding: 60px 6vw 70px;
    }

    .inquiry-grid {
        grid-template-columns: 1fr;
        gap: 20px;
    }

    .inquiry-card {
        padding: 28px 22px 32px;
    }

    .inquiry-actions {
        flex-direction: column;
    }

    .btn-inquiry {
        flex: unset;
        width: 100%;
        justify-content: center;
        padding: 14px 20px;
    }

    .landline-text {
        font-size: 14px;
        padding: 8px 16px;
        width: 100%;
        justify-content: center;
    }

    .inquiry-heading h2 {
        font-size: 28px;
    }
}

@media (max-width: 480px) {
    .inquiry-section {
        padding: 40px 5vw 50px;
    }

    .inquiry-card {
        padding: 22px 16px 26px;
        border-radius: 16px;
    }

    .inquiry-icon {
        width: 48px;
        height: 48px;
        font-size: 20px;
    }

    .inquiry-heading {
        margin-bottom: 30px;
    }
}
  </style>
</head>
<body>
  <jsp:include page="./includes/navbar/navbar.jsp" />
  <!-- ========== PRELOADER ========== -->
  <div id="preloader">
    <div class="spinner"></div>
    <p>Loading experience</p>
  </div>

  <!-- ========== PAGE CONTENT ========== -->
  <div class="page-content" id="pageContent">

    <!-- =====================================================
    NAVBAR (from first file)
    ===================================================== -->

    <!-- =====================================================
    ONBOARDING PAGE CONTENT
    ===================================================== -->

    <!-- ================= VIDEO SECTION 01 ================= -->
    <section class="hero">
      <div class="video-wrap">
        <video class="scroll-video" muted playsinline preload="auto" loop>
          <source src="video.mp4" type="video/mp4">
        </video>
        <div class="video-end-cta">
          <small>The journey continues</small>
          <h2>READY TO<br>GET STARTED?</h2>
          <a class="btn" href="#services">Explore Services</a>
        </div>
      </div>
    </section>

   <!-- ================= SECTION 1: QUICK COMMERCE ================= -->
<section class="service-section section-quickcommerce">
  <div class="section-header">
    <small>01 · Quick Commerce</small>
    <h2>Lightning-Fast Delivery</h2>
    <p>Get your products delivered in minutes with India's top quick commerce platforms.</p>
  </div>
  <div class="service-grid">
    <!-- Blinkit -->
    <a href="${pageContext.request.contextPath}/services/quick-commerce/blinkit-onboarding-services/" class="service-card card-blinkit" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/1.png" width="100%" alt="Blinkit">
      </div>
      <div class="brand-name">Blinkit</div>
      <span class="brand-tag">10-Minute Delivery</span>
      <p class="brand-desc">Streamlined onboarding with real-time inventory sync and 10-min delivery optimization.</p>
      <div class="card-footer">
        <div class="card-tags"><span>⚡ Quick Commerce</span><span class="dot"></span><span>📦 Inventory</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
    <!-- Swiggy Instamart -->
    <a href="${pageContext.request.contextPath}/services/quick-commerce/swiggy-instamart-onboarding-services/" class="service-card card-swiggy" target="_blank">

		  <div class="brand-glow"></div>
		
		  <div class="brand-logo">
		    <img src="logo/2.png" width="100%" alt="Swiggy Instamart">
		  </div>
		
		  <div class="brand-name">Swiggy Instamart</div>
		
		  <span class="brand-tag">Quick Commerce</span>
		
		  <p class="brand-desc">
		    Complete Swiggy Instamart seller onboarding with catalog setup, product listing, and quick-commerce integration.
		  </p>
		
		  <div class="card-footer">
		
		    <div class="card-tags">
		      <span>🛒 Quick Commerce</span>
		      <span class="dot"></span>
		      <span>🚚 Delivery</span>
		    </div>
		
		    <span class="btn-silver">
		      Onboard
		      <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
		        <path
		          stroke-linecap="round"
		          stroke-linejoin="round"
		          stroke-width="2"
		          d="M14 5l7 7m0 0l-7 7m7-7H3">
		        </path>
		      </svg>
		    </span>
		
		  </div>
		
		</a>
    <!-- BigBasket -->
    <a href="${pageContext.request.contextPath}/services/quick-commerce/big-basket-onboarding/" class="service-card card-bigbasket" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/3.png" width="100%" alt="BigBasket">
      </div>
      <div class="brand-name">BigBasket</div>
      <span class="brand-tag">Grocery Retail</span>
      <p class="brand-desc">End-to-end vendor onboarding with supply chain automation and quality assurance.</p>
      <div class="card-footer">
        <div class="card-tags"><span>🛒 Grocery</span><span class="dot"></span><span>🔗 Supply Chain</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
    <!-- Zepto -->
    <a href="${pageContext.request.contextPath}/services/quick-commerce/zepto-onboarding-services/" class="service-card card-zepto" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/10.png" width="100%" alt="Zepto">
      </div>
      <div class="brand-name">Zepto</div>
      <span class="brand-tag">Quick Commerce</span>
      <p class="brand-desc">Dark store onboarding with automated picking and delivery partner training.</p>
      <div class="card-footer">
        <div class="card-tags"><span>⚡ Quick</span><span class="dot"></span><span>🏪 Dark Store</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
  </div>
</section>

<!-- ================= SECTION 2: MODERN TRADE ================= -->
<section class="service-section section-quickcommerce">
  <div class="section-header">
    <small>02 · Modern Trade</small>
    <h2>Leading Retail Chains</h2>
    <p>Expand your reach with India's top modern trade retail chains.</p>
  </div>
  <div class="service-grid">
    <!-- DMart -->
    <a href="${pageContext.request.contextPath}/services/e-commerce/d-mart/" class="service-card card-dmart" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/13.png" width="100%" alt="DMart">
      </div>
      <div class="brand-name">DMart</div>
      <span class="brand-tag">Retail Chain</span>
      <p class="brand-desc">Vendor onboarding with supply chain integration and retail compliance.</p>
      <div class="card-footer">
        <div class="card-tags"><span>🏪 Retail</span><span class="dot"></span><span>📦 Supply Chain</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
    <!-- Vishal Megamart -->
    <a href="#" class="service-card card-vishal" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/14.png" width="100%" alt="Vishal Megamart">
      </div>
      <div class="brand-name">Vishal Megamart</div>
      <span class="brand-tag">Retail Chain</span>
      <p class="brand-desc">Vendor onboarding with category management and retail store integration.</p>
      <div class="card-footer">
        <div class="card-tags"><span>🏪 Retail</span><span class="dot"></span><span>📊 Category</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
  </div>
</section>

<!-- ================= SECTION 3: E-COMMERCE ================= -->
<section class="service-section section-quickcommerce" id="services">
  <div class="section-header">
    <small>03 · E-Commerce</small>
    <h2>India's Leading Marketplaces</h2>
    <p>Seamless onboarding for India's top e-commerce platforms. Get your products listed and start selling.</p>
  </div>
  <div class="service-grid">
    <!-- Flipkart -->
    <a href="${pageContext.request.contextPath}/services/quick-commerce/flipkart/" class="service-card card-flipkart" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/4.png" width="100%" alt="Flipkart">
      </div>
      <div class="brand-name">Flipkart</div>
      <span class="brand-tag">E-Commerce</span>
      <p class="brand-desc">Marketplace seller onboarding with catalog management and payment gateway setup.</p>
      <div class="card-footer">
        <div class="card-tags"><span>🛍️ Marketplace</span><span class="dot"></span><span>💳 Payments</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
    <!-- Amazon -->
    <a href="${pageContext.request.contextPath}/services/quick-commerce/amazon-now-onboarding-services/" class="service-card card-amazon" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/5.png" width="100%" alt="Amazon">
      </div>
      <div class="brand-name">Amazon</div>
      <span class="brand-tag">Global Marketplace</span>
      <p class="brand-desc">Global seller registration with FBA integration and multi-channel fulfillment.</p>
      <div class="card-footer">
        <div class="card-tags"><span>🌍 Global</span><span class="dot"></span><span>📦 FBA</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
    <!-- Meesho -->
    <a href="${pageContext.request.contextPath}/services/e-commerce/meesho/" class="service-card card-meesho" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/12.png" width="100%" alt="Meesho">
      </div>
      <div class="brand-name">Meesho</div>
      <span class="brand-tag">Social Commerce</span>
      <p class="brand-desc">Reseller onboarding with catalog sharing tools and commission tracking workflows.</p>
      <div class="card-footer">
        <div class="card-tags"><span>🛍️ Social</span><span class="dot"></span><span>💰 Commission</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
    <!-- Jiomart -->
    <a href="${pageContext.request.contextPath}/services/e-commerce/jio-mart/" class="service-card card-jiomart" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/7.png" width="100%" alt="Jiomart">
      </div>
      <div class="brand-name">Jiomart</div>
      <span class="brand-tag">Digital Commerce</span>
      <p class="brand-desc">Vendor ecosystem onboarding with hyperlocal inventory and digital payments.</p>
      <div class="card-footer">
        <div class="card-tags"><span>🏪 Digital</span><span class="dot"></span><span>💳 Payments</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
    <!-- Nykaa -->
    <a href="${pageContext.request.contextPath}/services/e-commerce/nykaa/" class="service-card card-nykaa" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/11.png" width="100%" alt="Nykaa">
      </div>
      <div class="brand-name">Nykaa</div>
      <span class="brand-tag">Beauty Retail</span>
      <p class="brand-desc">Beauty brand onboarding with inventory management and omnichannel retail setup.</p>
      <div class="card-footer">
        <div class="card-tags"><span>💄 Beauty</span><span class="dot"></span><span>🔄 Omnichannel</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
    <!-- Myntra -->
    <a href="${pageContext.request.contextPath}/services/e-commerce/myntra/" class="service-card card-myntra" target="_blank">
      <div class="brand-glow"></div>
      <div class="brand-logo">
        <img src="logo/8.png" width="100%" alt="Myntra">
      </div>
      <div class="brand-name">Myntra</div>
      <span class="brand-tag">Fashion Retail</span>
      <p class="brand-desc">Fashion brand onboarding with catalog management and seasonal inventory planning.</p>
      <div class="card-footer">
        <div class="card-tags"><span>👗 Fashion</span><span class="dot"></span><span>📊 Inventory</span></div>
        <span class="btn-silver">Onboard <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg></span>
      </div>
    </a>
  </div>
</section>
   
<!-- Info Div for Video 02 -->
    <div class="video-info-block float-left" data-animation="left">
      <div class="info-inner">
        <small>02 · Client Experience</small>
        <h2>How Onboarding Works</h2>
        <p>Learn how we set up your account, establish project milestones, and build a clear roadmap tailored to kickstart your growth immediately.</p>
      </div>
    </div>

    <!-- ================= VIDEO SECTION 02 ================= -->
    <section class="hero">
      <div class="video-wrap">
        <video class="scroll-video" muted playsinline preload="auto" loop>
          <source src="v4.mp4" type="video/mp4">
        </video>
        <div class="video-end-cta">
          <small>02 · Client Experience</small>
          <h2>How Onboarding Works</h2>
          <a class="btn" href="#contact">Learn More</a>
        </div>
      </div>
    </section>
    <!-- Info Div for Video 03 -->
    <div class="video-info-block float-right" data-animation="right">
      <div class="info-inner">
        <small>04 · Marketplace Onboarding</small>
        <h2>Take Your Business Everywhere</h2>
        <p>From e-commerce to quick commerce, IARDO helps you onboard your business across leading platforms and reach more customers.</p>
      </div>
    </div>

    <!-- ================= VIDEO SECTION 03 ================= -->
    <section class="hero">
      <div class="video-wrap">
        <video class="scroll-video" muted playsinline preload="auto" loop>
          <source src="video5.mp4" type="video/mp4">
        </video>
        <div class="video-end-cta">
          <small>04 · Start Your Onboarding</small>
          <h2>GET ONBOARDED<br>& GROW FASTER</h2>
          <a class="btn" href="#contact">Start Onboarding</a>
        </div>
      </div>
    </section>

    

    <!-- CTA -->
    <section class="cta" id="contact">
      <div>
        <small style="letter-spacing:4px;text-transform:uppercase;color:#888;">ready to elevate</small>
        <h2>LET'S<br>ONBOARD.</h2>
        <p>Multiple companies, one trusted partner. Let's build an onboarding experience that sets your people up for success.</p>
        <a class="btn" href="#">Start the conversation</a>
      </div>
    </section>

    <!-- =====================================================
    INQUIRY SECTION (Feel Free to Inquiry)
    ===================================================== -->
<section class="inquiry-section" id="inquiry">
    <div class="inquiry-container">

        <!-- Section Heading -->
        <div class="inquiry-heading">
            <span class="inquiry-badge">📞 Get in Touch</span>
            <h2>Feel Free to <span>Inquiry</span></h2>
            <p>Our team is ready to assist you. Reach out to us anytime.</p>
        </div>

        <!-- Inquiry Grid -->
        <div class="inquiry-grid">

            <!-- Address Box -->
            <div class="inquiry-card address-card">
                <div class="inquiry-icon">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <h4>Our Address</h4>
                <p>
                	714 - 715, Seventh Floor, <br>
                	Amba Tower, DC Chowk Central Market, Sector - 9, <br>
                	Rohini, Delhi - 110085
                </p>
                <span class="landline-text">
                    <i class="fas fa-phone-alt"></i> 011 3500 0243
                </span>
                <span class="landline-text">
                    <i class="fas fa-phone-alt"></i> 011 3500 0245
                </span>
            </div>

            <!-- Contact Actions Box -->
            <div class="inquiry-card actions-card">
                <div class="inquiry-icon">
                    <i class="fas fa-headset"></i>
                </div>
                <h4>Quick Connect</h4>
                <p>Call us or WhatsApp for instant support</p>
                <div class="inquiry-actions">
                    <!-- Call Button -->
                    <a href="tel:+919876543210" class="btn-inquiry btn-call">
                        <i class="fas fa-phone"></i> Call Now
                    </a>
                    <!-- WhatsApp Button -->
                    <a href="https://wa.me/919876543210?text=Hello%20IARDO%2C%20I%20need%20assistance" 
                       target="_blank" class="btn-inquiry btn-whatsapp">
                        <i class="fab fa-whatsapp"></i> WhatsApp
                    </a>
                </div>
                <span class="contact-note">Mon–Sat, 9 AM – 7 PM</span>
            </div>

        </div>
    </div>
</section>

    <!-- Scroll to Top -->
    <button class="scroll-top" id="scrollTopBtn" aria-label="Scroll to top">
      <i class="fas fa-arrow-up"></i>
    </button>
  <jsp:include page="./includes/footer/footer.jsp" />
  </div> 
  <script>
    (function() {

      // ── PRELOADER LOGIC ──
      const preloader = document.getElementById('preloader');
      const pageContent = document.getElementById('pageContent');
      pageContent.classList.remove('ready');

      let videosLoaded = 0;
      const videos = document.querySelectorAll('.scroll-video');
      const totalVideos = videos.length;

      function checkAllLoaded() {
        if (totalVideos === 0 || videosLoaded >= totalVideos) {
          hidePreloader();
        }
      }

      function hidePreloader() {
        preloader.classList.add('hidden');
        pageContent.classList.add('ready');
        document.body.style.overflow = '';
      }

      if (totalVideos === 0) {
        hidePreloader();
      } else {
        videos.forEach(video => {
          if (video.readyState >= 2) {
            videosLoaded++;
            checkAllLoaded();
            return;
          }
          const onLoad = () => {
            videosLoaded++;
            checkAllLoaded();
            video.removeEventListener('loadedmetadata', onLoad);
            video.removeEventListener('canplay', onLoad);
            video.removeEventListener('loadeddata', onLoad);
            video.removeEventListener('error', onError);
          };
          const onError = () => {
            videosLoaded++;
            checkAllLoaded();
            video.removeEventListener('loadedmetadata', onLoad);
            video.removeEventListener('canplay', onLoad);
            video.removeEventListener('loadeddata', onLoad);
            video.removeEventListener('error', onError);
          };
          video.addEventListener('loadedmetadata', onLoad);
          video.addEventListener('canplay', onLoad);
          video.addEventListener('loadeddata', onLoad);
          video.addEventListener('error', onError);
        });
        setTimeout(() => {
          if (!preloader.classList.contains('hidden')) {
            videos.forEach(video => {
              if (video.readyState < 2) videosLoaded++;
            });
            hidePreloader();
          }
        }, 6000);
      }

      // ── INTERSECTION OBSERVER with faster threshold ──
      const animatedElements = document.querySelectorAll('.video-info-block, .service-card');
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.add('visible');
          } else {
            entry.target.classList.remove('visible');
          }
        });
      }, { threshold: 0.15, rootMargin: '0px 0px -30px 0px' }); // Faster detection
      animatedElements.forEach(el => observer.observe(el));

      // ── VIDEO SCROLL CONTROLLER ──
      const isMobile = window.innerWidth <= 819;
      const heroSections = document.querySelectorAll('.hero');

      if (isMobile) {
        const mobileObserver = new IntersectionObserver((entries) => {
          entries.forEach(entry => {
            const video = entry.target.querySelector('.scroll-video');
            if (entry.isIntersecting) {
              video.play().catch(() => {});
            } else {
              video.pause();
            }
          });
        }, { threshold: 0.4 });
        heroSections.forEach(hero => mobileObserver.observe(hero));
      } else {
        const heroesData = Array.from(heroSections).map(hero => {
          const video = hero.querySelector('.scroll-video');
          const cta = hero.querySelector('.video-end-cta');
          return { hero, video, cta, duration: 0, targetTime: 0, currentTime: 0, hasShownCta: false };
        });
        heroesData.forEach(item => {
          item.video.addEventListener('loadedmetadata', () => { item.duration = item.video.duration; });
          if (item.video.readyState >= 2) { item.duration = item.video.duration; }
        });
        function updateTargets() {
          const viewHeight = window.innerHeight;
          heroesData.forEach(item => {
            const rect = item.hero.getBoundingClientRect();
            const maxScroll = item.hero.offsetHeight - viewHeight;
            if (rect.bottom < 0 || rect.top > viewHeight || maxScroll <= 0 || !item.duration) return;
            let progress = Math.min(1, Math.max(0, -rect.top / maxScroll));
            if (progress > 0.98) progress = 1;
            item.targetTime = progress * item.duration;
            if (progress >= 0.95 && !item.hasShownCta) {
              item.hasShownCta = true;
              if (item.cta) item.cta.classList.add('show');
            } else if (progress < 0.95 && item.hasShownCta) {
              item.hasShownCta = false;
              if (item.cta) item.cta.classList.remove('show');
            }
          });
        }
        function updateVideos() {
          heroesData.forEach(item => {
            if (!item.duration) return;
            const diff = item.targetTime - item.currentTime;
            if (Math.abs(diff) > 0.005) {
              item.currentTime += diff * 0.2;
              if (item.video.readyState >= 2) {
                try { item.video.currentTime = item.currentTime; } catch (_) {}
              }
            }
          });
          requestAnimationFrame(updateVideos);
        }
        window.addEventListener('scroll', updateTargets, { passive: true });
        window.addEventListener('resize', updateTargets, { passive: true });
        updateTargets();
        requestAnimationFrame(updateVideos);
      }

      // ── MOBILE TOGGLES ──
      
      // ── MEGA MENU POSITIONING ──

      // ── SCROLL TO TOP ──
      const scrollBtn = document.getElementById('scrollTopBtn');
      if (scrollBtn) {
        window.addEventListener('scroll', function() {
          scrollBtn.classList.toggle('active', window.scrollY > 400);
        });
        scrollBtn.addEventListener('click', function() {
          window.scrollTo({ top: 0, behavior: 'smooth' });
        });
      }

      /* // ── RESIZE HANDLER ──
      let lastWidth = window.innerWidth;
      window.addEventListener('resize', function() {
        var currentWidth = window.innerWidth;
        var wasMobile = lastWidth <= 819;
        var isNowMobile = currentWidth <= 819;
        if (wasMobile !== isNowMobile) {
          location.reload();
        }
        lastWidth = currentWidth;
      }); */

    })();
  </script>

</body>
</html>