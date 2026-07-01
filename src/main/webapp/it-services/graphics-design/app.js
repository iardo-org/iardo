document.querySelectorAll('.industry-card').forEach(card => {
    const images = card.querySelectorAll('img');
    let currentIndex = 0;

    if (images.length > 1) {
        setInterval(() => {
            images[currentIndex].classList.remove('active');
            currentIndex = (currentIndex + 1) % images.length;
            images[currentIndex].classList.add('active');
        }, 3000);
    }
});

// Help Cards Interaction
document.querySelectorAll('.help-card').forEach(card => {
    card.addEventListener('mouseenter', () => {
        document.querySelectorAll('.help-card').forEach(c => c.classList.remove('active'));
        card.classList.add('active');
    });
});
