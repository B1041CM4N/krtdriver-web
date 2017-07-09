class BankAccountController < ApplicationController
  before_action :authenticate_user!
  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_params)
    @bank_account.bank_account_type = params[:ta_id]
    @bank_account.user_id = current_user.user_id
    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to new_bank_account_store_url(@bank_account), notice: 'La cuenta bancaria ha sido creada exitosamente' }
        format.json { render :show, status: :created, location: @bank_account }
      else
        format.html { render :new }
        format.json { render :json, @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def bank_account_params
    params.require(:bank_account).permit!
  end
end
