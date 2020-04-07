const regex = RegExp('youtube');

// insert div around iframe with correct and responsive clsss

const insertDiv = (item) => {
  const div = document.createElement('div');
  div.setAttribute("class", "iframe-container")
  item.parentNode.insertBefore(div, item);
  div.appendChild(item);
};

// target only iframes that are from youtube as other iframes are already responsive

const detectYouTube = (item) => {
  if (regex.test(item.src)) {
    insertDiv(item)};
};

// will only target iframes on home page

const embedIframes = () => {
  if (document.location.pathname.substr(1) === "home") {
    const list = document.getElementsByTagName("iframe");
    for (let item of list) {
      detectYouTube(item);
    };
  };
};

export { embedIframes }
