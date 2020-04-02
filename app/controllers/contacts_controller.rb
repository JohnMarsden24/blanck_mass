class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @contacts = Contact.all
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      redirect_to contacts_index_path
    else
      redirect_to admin_path
    end
  end

  def update
    contact = find_contact
    if contact.update(contact_params)
      redirect_to contacts_index_path
    else
      redirect_to admin_path
    end
  end

  def destroy
    contact = find_contact
    contact.destroy
    redirect_to contacts_index_path
  end

  private

  def find_contact
    Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:email, :name, :job_description)
  end
end
