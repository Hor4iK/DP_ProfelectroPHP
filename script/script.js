//@ DOM-elements
const menu = document.querySelector(".top-menu");
const menuTriggers = Array.from(document.querySelectorAll(".menu"));


const getClassShowHide = (evt) => {
  menu.classList.toggle('type__visible');
}

menuTriggers.forEach((item) => {
  item.addEventListener("click", getClassShowHide);
});
