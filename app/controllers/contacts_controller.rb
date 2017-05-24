class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @errors = []
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = 'Correo Electrónico enviado exitosamente!'
    else
      flash[:alert] = 'Ha ocurrido un problema!'
    end
    render :index
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :contact_number, :store_name)
  end
end
