const navSlide = () => {
  const corpo = document.getElementsByTagName("BODY")[0];
  const burger = document.querySelector('.burger');
  const navLinks = document.querySelector('.navlinks');
  const navItems = document.querySelectorAll('.navlinks li');
  // Toggle menu
  burger.addEventListener('click', ()=>{
    navLinks.classList.toggle('navlinks');
    navLinks.classList.toggle('nav-active');

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
      corpo.classList.toggle('stop-scrolling');
  });
}

const navScroll = () => {
  const nav = document.querySelector('.navbar-container');
  window.onscroll = function() {
    var currentScrollPos = window.pageYOffset;
    if (currentScrollPos > 80) {
      nav.style.transform = "translateY(-100%)";
    } else {
      nav.style.transform = "translateY(0%)";
    }
 }
}  

navSlide();
navScroll();