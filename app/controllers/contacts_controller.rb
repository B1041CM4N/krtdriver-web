class ContactsController < ApplicationController
  before_action :set_module

  def index
    @contact = Contact.new
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = 'Pronto estaremos en contacto contigo!!!'
      if ContactMailer.first_steps(@contact).deliver_now
        redirect_to root_path
      else
        flash[:alert] = "Ha ocurrido un problema al tratar de enviar el correo de contacto"
      end
    else
      flash[:alert] = 'Ha ocurrido un problema!'
      render :new
    end
  end

  private

  def set_module
    @module = "Contact"
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :contact_number, :store_name)
  end
end
