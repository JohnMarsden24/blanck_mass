const existChecker = (form) => {
  if (form.style.display === "none") {
    form.style.display = "block";
  } else {
    form.style.display = "none";
  };
};


const showEditForm = (event) => {
  const id = event.currentTarget.dataset.id;
  const form = document.getElementById(`inline_post_${id}`);
  existChecker(form);
}

const addListeners = () => {
  document.querySelectorAll('.edit-post').forEach(show => {
  show.addEventListener('click', showEditForm)
  });
}

const editPostForm = () => {
  addListeners();
};

export { editPostForm };
