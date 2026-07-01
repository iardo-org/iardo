/*const dot = document.querySelector('.cur-dot');
const ring = document.querySelector('.cur-ring');
let mx = 0, my = 0, rx = 0, ry = 0;
document.addEventListener('mousemove', e => {
  mx = e.clientX; my = e.clientY;
  dot.style.cssText = `left:${mx}px;top:${my}px`;
});
(function animCursor() {
  rx += (mx - rx) * .11; ry += (my - ry) * .11;
  ring.style.cssText = `left:${rx}px;top:${ry}px`;
  requestAnimationFrame(animCursor);
})();
document.querySelectorAll('a,button,.pillar,.init-card,.goal-item').forEach(el => {
  el.addEventListener('mouseenter', () => {
    ring.style.width = ring.style.height = '54px';
    ring.style.background = 'rgba(45,106,79,.08)';
  });
  el.addEventListener('mouseleave', () => {
    ring.style.width = ring.style.height = '34px';
    ring.style.background = 'transparent';
  });
});*/

const nav = document.getElementById('mainNav');
if(nav) {
  window.addEventListener('scroll', () => nav.classList.toggle('scrolled', window.scrollY > 50));
}

const io = new IntersectionObserver(entries => {
  entries.forEach(e => { if (e.isIntersecting) { e.target.classList.add('vis'); io.unobserve(e.target); } });
}, { threshold: 0.1 });
document.querySelectorAll('.reveal,.reveal-l,.reveal-r').forEach(el => io.observe(el));

function runCount(el, target, suffix='') {
  const dur = 1800;
  let start = null;
  const ease = t => 1 - Math.pow(1-t, 4);
  const step = ts => {
    if (!start) start = ts;
    const p = Math.min((ts-start)/dur, 1);
    const val = Math.floor(ease(p) * target);
    const span = el.querySelector('span');
    if (span) { el.childNodes[0].textContent = val; }
    else { el.textContent = val + suffix; }
    if (p < 1) requestAnimationFrame(step);
    else {
      if (span) el.childNodes[0].textContent = target;
      else el.textContent = target + suffix;
    }
  };
  requestAnimationFrame(step);
}
const cio = new IntersectionObserver(entries => {
  entries.forEach(e => {
    if (e.isIntersecting) {
      const el = e.target;
      const target = parseInt(el.dataset.count, 10);
      if (!isNaN(target)) runCount(el, target);
      cio.unobserve(el);
    }
  });
}, { threshold: .5 });
document.querySelectorAll('[data-count]').forEach(el => cio.observe(el));

(function spawnLeaves() {
  const container = document.getElementById('leavesContainer');
  if (!container) return;
  const leafEmojis = ['🌿','🍃','🌱','🍀','🌾','🪴'];
  function makeLeaf() {
    const el = document.createElement('div');
    el.className = 'leaf';
    el.textContent = leafEmojis[Math.floor(Math.random() * leafEmojis.length)];
    const size = 0.7 + Math.random() * 1.2;
    el.style.cssText = `left: ${Math.random() * 100}%; font-size: ${size}rem; animation-duration: ${8 + Math.random() * 12}s; animation-delay: ${Math.random() * 10}s; filter: blur(${Math.random() * .5}px) drop-shadow(0 4px 12px rgba(0,0,0,.15));`;
    container.appendChild(el);
    el.addEventListener('animationend', () => el.remove());
  }
  for (let i = 0; i < 18; i++) makeLeaf();
  setInterval(() => { if (container.children.length < 25) makeLeaf(); }, 1800);
})();

document.querySelectorAll('.pillar').forEach(card => {
  card.addEventListener('mousemove', e => {
    const r = card.getBoundingClientRect();
    const x = ((e.clientX - r.left) / r.width  - .5) * 12;
    const y = ((e.clientY - r.top)  / r.height - .5) * -12;
    card.style.transform = `translateY(-10px) perspective(700px) rotateY(${x}deg) rotateX(${y}deg)`;
  });
  card.addEventListener('mouseleave', () => { card.style.transform = ''; });
});

const hamburger = document.getElementById('hamburger');
if(hamburger) {
  hamburger.addEventListener('click', function () {
    const links = document.querySelector('.nav-links');
    const open  = links.style.display === 'flex';
    Object.assign(links.style, open ? { display:'' } : {
      display:'flex', flexDirection:'column', gap:'18px',
      position:'absolute', top:'70px', left:0, right:0,
      background:'rgba(255,255,255,.97)', padding:'28px 6vw',
      borderBottom:'1px solid rgba(45,106,79,.1)',
      backdropFilter:'blur(22px)', zIndex:99
    });
  });
}