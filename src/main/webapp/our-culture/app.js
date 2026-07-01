/* ── Scroll Reveal ── */
const revealObserver = new IntersectionObserver(entries => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('active');
        }
    });
}, { threshold: 0.12 });

document.querySelectorAll('.reveal').forEach(el => revealObserver.observe(el));

/* ── Counter Animation ── */
function animateCounter(el) {
    const target = parseInt(el.getAttribute('data-target'), 10);
    const suffix = el.textContent.replace(/[0-9]/g, '').trim();
    const duration = 1800;
    const startTime = performance.now();

    function update(currentTime) {
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);
        const eased = 1 - Math.pow(1 - progress, 3); // ease-out cubic
        el.textContent = Math.floor(eased * target) + (target === 98 ? '%' : '+');
        if (progress < 1) requestAnimationFrame(update);
    }
    requestAnimationFrame(update);
}

const statsObserver = new IntersectionObserver(entries => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.querySelectorAll('.stat-num[data-target]').forEach(el => {
                animateCounter(el);
                el.removeAttribute('data-target');
            });
            statsObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.4 });

const strip = document.querySelector('.stats-strip');
if (strip) statsObserver.observe(strip);

/* ── Mobile Navbar Fix ── */
function applyMobileNav() {
    const navGlass   = document.querySelector('.nav-glass');
    const hamburger  = document.querySelector('.hamburger');
    const langSwitch = document.querySelector('.language-switcher');

    if (window.innerWidth <= 768) {
        navGlass   && navGlass.style.setProperty('display', 'none', 'important');
        hamburger  && hamburger.style.setProperty('display', 'flex', 'important');
        langSwitch && langSwitch.style.setProperty('display', 'none', 'important');
    } else {
        navGlass   && navGlass.style.removeProperty('display');
        hamburger  && hamburger.style.removeProperty('display');
        langSwitch && langSwitch.style.removeProperty('display');
    }
}

applyMobileNav();
window.addEventListener('resize', applyMobileNav);