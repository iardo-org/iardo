// Live counter animation
  let orders = 47, rev = 68400;
  setInterval(() => {
    orders += Math.floor(Math.random() * 3);
    rev    += Math.floor(Math.random() * 2000 + 500);
    document.getElementById("orders").textContent = orders;
    document.getElementById("rev").textContent = rev.toLocaleString('en-IN');
  }, 2200);

  // Scroll reveal
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.classList.add('visible');
        observer.unobserve(e.target);
      }
    });
  }, { threshold: 0.1 });
  document.querySelectorAll('.reveal').forEach(el => observer.observe(el));