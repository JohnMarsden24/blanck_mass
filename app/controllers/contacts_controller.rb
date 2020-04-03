class ContactsController < AdminController

  private

  def redirect
    redirect_to contacts_index_path
  end

  def strong_params
    params.require(:contact).permit(:email, :name, :job_description)
  end
end
