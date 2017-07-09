class RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to new_bank_account_url, notice: 'Un correo de confirmación ha sido enviado a la dirección ingresada' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render :json, @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def contact_with_owner
  end

  def edit
    super
  end

  def update
    super
  end

  private

  def root_url
    new_user_registration_url
  end

  def user_params
    params.require(:user).permit!
  end
end
