
const initStickyNavbarOnScroll = () => {
  const shows = document.querySelector('.shows');
  if (shows) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        shows.classList.add('sticky');
      }
    });
  }
}

export { initStickyNavbarOnScroll };
