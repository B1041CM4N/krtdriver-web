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
      if ContactMailer.first_steps(@contact).deliver_now
        flash[:success] = 'Pronto estaremos en contacto contigo!!!'
        redirect_to root_path
      else
        flash[:alert] = "Ha ocurrido un problema al tratar de enviar el correo de contacto"
      end
    else
      flash[:alert] = 'Ha ocurrido un problema!'
      render :new
    end
  end


  #def create
  #  @user = User.new(params[:user])
 #
  #  respond_to do |format|
  #    if @user.save
  #      # Tell the UserMailer to send a welcome email after save
  #      UserMailer.welcome_email(@user).deliver_later
 #
  #      format.html { redirect_to(@user, notice: 'User was successfully created.') }
  #      format.json { render json: @user, status: :created, location: @user }
  #    else
  #      format.html { render action: 'new' }
  #      format.json { render json: @user.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :contact_number, :store_name)
  end
end
