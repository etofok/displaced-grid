document.addEventListener('DOMContentLoaded', () => {
  const navbar = document.querySelector('.navbar');

  function handleScroll() {
    if (window.scrollY > 10) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  }

  window.addEventListener('scroll', handleScroll);

  handleScroll();
});