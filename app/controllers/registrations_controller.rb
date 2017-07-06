class RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    Rails.logger.info 'PARAMS:::: ' + params.inspect + ' *********************'
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'La cuenta ha sido creada exitosamente, nos pondremos en contacto con usted'
      redirect_to new_store_url
      # Iniciación de los datos
      # @address = Address.new
      # @store = Store.new
      # @provider = Provider.new
      # @payment_method = PaymentMethod.new
      # @bank_account = BankAccount.first
      # Revisar
      # @provider.Store_id = @store.Store_id
      # @provider.Address_id = @address.Address_id
      # @provider.PaymentMethod_id = @payment_method.PaymentMethod_id
      # @provider.Bank_account_id = @bank_account.Bank_account_id
      # @provider.First_name = Faker::Name.first_name
      # @provider.Last_name = Faker::Name.last_name
      # @address.Street_name = @user.street_name
      # @store.Address_id = @address.Address_id
      # @store.Name = @user.store_name
      # @store.Description = @user.store_description
      # @store.users_id = @user.id
      # @address.save
      # @store.save
      # redirect_to root_url
      # provider.save
    else
      flash[:error] = 'Ha ocurrido un problema al tratar de registrarse'
      @user = User.new
      render :new
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
