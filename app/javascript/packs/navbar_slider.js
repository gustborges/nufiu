const navSlide = () => {
  const burger = document.querySelector('.burger');
  const nav = document.querySelector('.navlinks');
  const navItems = document.querySelectorAll('.navlinks li');
  // Toggle menu
  burger.addEventListener('click', ()=>{
    nav.classList.toggle('navlinks');
    nav.classList.toggle('nav-active');
  
      // Animate Links
      navItems.forEach((link, index) => {
        if(link.style.animation) {
          link.style.animation = '';
        } else {
          link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.6}s`;
        }
      });
      // Burger animation
      burger.classList.toggle('toggle');
  });
}

navSlide();