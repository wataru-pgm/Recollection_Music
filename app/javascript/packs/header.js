window.onload = function(){
  const button = document.querySelector('#navbar-toggle'); // Hamburger Icon
  const menu = document.querySelector('#navbar-collapse'); // Menu

  button.addEventListener('click', () => {
    menu.classList.toggle('hidden');
  });
};
