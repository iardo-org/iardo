// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    
    // FAQ accordion functionality
    const faqItems = document.querySelectorAll('.faq-item');
    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');
        const btn = item.querySelector('.faq-btn');
        
        question.addEventListener('click', function() {
            // Close all other FAQ items
            faqItems.forEach(otherItem => {
                if (otherItem !== item) {
                    otherItem.classList.remove('active');
                    const otherBtn = otherItem.querySelector('.faq-btn');
                    if (otherBtn) otherBtn.textContent = '∨';
                }
            });
            
            // Toggle current FAQ item
            item.classList.toggle('active');
            if (btn) {
                btn.textContent = item.classList.contains('active') ? '∧' : '∨';
            }
        });
    });
    
    // Form submission handling
    const contactForm = document.querySelector('.contact-form');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const name = this.querySelector('input[type="text"]').value;
            const email = this.querySelector('input[type="email"]').value;
            const message = this.querySelector('textarea').value;
            
            console.log('Form submitted:', { name, email, message });
            alert('Thank you for your message! We will get back to you soon.');
            this.reset();
        });
    }
    
    // Navbar scroll effect
    const navbar = document.querySelector('.navbar');
    /*if (navbar) {
        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });
    }*/
    
    // Counter animation for stats
    const counters = document.querySelectorAll('[data-count]');
    const animateCounter = (counter) => {
        const target = parseInt(counter.getAttribute('data-count'));
        let count = 0;
        const speed = 2000 / target;
        
        const updateCount = () => {
            if (count < target) {
                count++;
                counter.textContent = count;
                setTimeout(updateCount, speed);
            } else {
                counter.textContent = target;
            }
        };
        
        const observer = new IntersectionObserver(entries => {
            if (entries[0].isIntersecting) {
                updateCount();
                observer.disconnect();
            }
        });
        
        observer.observe(counter);
    };
    
    counters.forEach(animateCounter);
    
    // Reveal animation on scroll
    const reveals = document.querySelectorAll('.reveal');
    const revealOnScroll = () => {
        reveals.forEach(element => {
            const elementTop = element.getBoundingClientRect().top;
            const windowHeight = window.innerHeight;
            if (elementTop < windowHeight - 100) {
                element.style.opacity = '1';
                element.style.transform = 'translateY(0)';
            }
        });
    };
    
    window.addEventListener('scroll', revealOnScroll);
    revealOnScroll();
    
    console.log('IARDO website loaded successfully!');
});




/* =====================================================
   about.js  —  Scroll Reveal + FAQ Toggle
===================================================== */

// ── Scroll Reveal via IntersectionObserver ──────────
const revealObserver = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible');
        revealObserver.unobserve(entry.target); // fire once
      }
    });
  },
  { threshold: 0.1, rootMargin: '0px 0px -40px 0px' }
);

document.querySelectorAll('.reveal').forEach((el) => revealObserver.observe(el));

// ── FAQ Accordion ─────────────────────────────────────
document.querySelectorAll('.faq-item').forEach((item) => {
  const question = item.querySelector('.faq-question');
  if (!question) return;
  question.addEventListener('click', () => {
    const isActive = item.classList.contains('active');
    document.querySelectorAll('.faq-item.active').forEach((o) => o.classList.remove('active'));
    if (!isActive) item.classList.add('active');
  });
});
