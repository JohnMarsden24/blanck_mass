const addActiveClass = (elem) => {
  elem.classList.add("active");
};

const findElement = (page) => {
  return document.getElementById(page);
};

const findPage = () => {
  return document.location.pathname.substr(1);
};

const setActive = () => {
  const page = findPage()
  const elem = findElement(page)
  addActiveClass(elem)
};

export { setActive }
