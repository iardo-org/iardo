"use strict";

// ===== SCROLL ANIMATIONS =====
function initScrollAnimations() {
  var cards = document.querySelectorAll(".service-card, .service-card-small");
  if (!window.IntersectionObserver) {
    cards.forEach(function (c) { c.classList.add("visible"); });
    return;
  }
  var observer = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        var delay = entry.target.dataset.delay || 0;
        setTimeout(function () { entry.target.classList.add("visible"); }, delay);
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1, rootMargin: "0px 0px -100px 0px" });
  cards.forEach(function (c) { observer.observe(c); });
}

// ===== PARALLAX (floating circles on mousemove) =====
function initParallax() {
  document.addEventListener("mousemove", function (e) {
    var x = e.clientX / window.innerWidth;
    var y = e.clientY / window.innerHeight;
    document.querySelectorAll(".floating-circle").forEach(function (el, i) {
      var s = (i + 1) * 30;
      el.style.transform = "translate(" + ((x - .5) * s) + "px," + ((y - .5) * s) + "px)";
    });
  });
  document.addEventListener("mouseleave", function () {
    document.querySelectorAll(".floating-circle").forEach(function (el) {
      el.style.transform = "translate(0,0)";
    });
  });
}

// ===== 3D TILT on cards =====
function initCardTilt() {
  document.querySelectorAll(".service-card, .service-card-small").forEach(function (card) {
    card.addEventListener("mousemove", function (e) {
      var r = card.getBoundingClientRect();
      var rx = ((e.clientY - r.top  - r.height / 2) / (r.height / 2)) * 5;
      var ry = ((e.clientX - r.left - r.width  / 2) / (r.width  / 2)) * -5;
      card.style.transform = "perspective(1000px) rotateX(" + rx + "deg) rotateY(" + ry + "deg) translateY(-10px)";
    });
    card.addEventListener("mouseleave", function () { card.style.transform = ""; });
  });
}

// ===== SMOOTH SCROLL for anchor links =====
function initSmoothScroll() {
  document.querySelectorAll('a[href^="#"]').forEach(function (a) {
    a.addEventListener("click", function (e) {
      var href = a.getAttribute("href");
      if (href === "#") return;
      e.preventDefault();
      var target = document.querySelector(href);
      if (target) target.scrollIntoView({ behavior: "smooth", block: "start" });
    });
  });
}

// ===== CARD CONTENT REVEAL on scroll =====
function initCardContentReveal() {
  var cards = document.querySelectorAll(".service-card");
  if (!cards.length || !window.IntersectionObserver) return;

  var observer = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        setTimeout(function () { entry.target.classList.add("content-visible"); }, 150);
      } else {
        entry.target.classList.remove("content-visible");
      }
    });
  }, { threshold: 0.3, rootMargin: "-50px 0px -50px 0px" });

  cards.forEach(function (c) { c.classList.remove("content-visible"); observer.observe(c); });
}

// ===== BOOT =====
function boot() {
  document.querySelectorAll(".service-card, .service-card-small").forEach(function (c) {
    c.classList.add("visible");
  });
  initScrollAnimations();
  initParallax();
  initCardTilt();
  initSmoothScroll();
}

function bootWithReveal() {
  boot();
  initCardContentReveal();
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", boot);
  window.addEventListener("load", function () { setTimeout(initCardContentReveal, 100); });
} else {
  setTimeout(bootWithReveal, 100);
}