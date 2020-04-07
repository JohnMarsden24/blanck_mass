// tineMCE script, removes it first to work with turbolinks

const postEditor = () => {
  tinymce.remove()
  tinymce.init({
    selector: '.post-form',
    plugins: 'a11ychecker advcode casechange formatpainter linkchecker autolink lists checklist media mediaembed pageembed permanentpen',
    toolbar: 'a11ycheck addcomment showcomments casechange checklist code formatpainter pageembed permanentpen',
    toolbar_mode: 'floating',
    tinycomments_mode: 'embedded',
    tinycomments_author: 'Author name',
  });
}

export { postEditor }
