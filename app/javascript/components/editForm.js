// changes forms display depending on if it is currently shown or not

const existChecker = (form) => {
  if (form.style.display === "none") {
    form.style.display = "block";
  } else {
    form.style.display = "none";
  };
};

// gets the ID of the form that has been clicked

const showForm = (event) => {
  const id = event.currentTarget.dataset.id;
  const elem = event.currentTarget.dataset.type;
  const form = document.getElementById(`inline_${elem}_${id}`);
  existChecker(form);
}

// adds listeners to the edit buttons

const addListeners = () => {
  document.querySelectorAll('.edit').forEach(show => {
  show.addEventListener('click', showForm)
  });
}

const editForm = () => {
  addListeners();
};

export { editForm };
