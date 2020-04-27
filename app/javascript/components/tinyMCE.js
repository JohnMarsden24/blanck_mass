// tineMCE script, removes it first to work with turbolinks

const postEditor = () => {
  tinymce.remove()
  tinymce.init({
    selector: '.post-form',
    plugins: 'link image autolink lists media',
    toolbar: 'link',
    toolbar_mode: 'floating',
    tinycomments_mode: 'embedded',
    tinycomments_author: 'Author name',
  });
}

export { postEditor }
