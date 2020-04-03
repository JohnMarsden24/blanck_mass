const regex = RegExp('youtube');

const insertDiv = (item) => {
  const div = document.createElement('div');
  div.setAttribute("class", "iframe-container")
  item.parentNode.insertBefore(div, item);
  div.appendChild(item);
};

const detectYouTube = (item) => {
  if (regex.test(item.src)) {
    insertDiv(item)};
};

const embedIframes = () => {
  if (document.location.pathname.substr(1) === "home") {
    const list = document.getElementsByTagName("iframe");
    for (let item of list) {
      detectYouTube(item);
    };
  };
};

export { embedIframes }
