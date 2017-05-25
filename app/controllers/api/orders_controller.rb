class Api::OrdersController < ApiController

  respond_to :json
  
  def index
    if params[:id_user].present?
      rand_id = Random.rand(50)
      #@user = User.find(1)
      Rails.logger.info 'RANDOM NUMBER: ' + rand_id.to_s + ' ************'
      @users = User.all
    else
      render json: { errors: @users.errors.full_messages }, status: 422
    end
    #render json: { errors: @users.errors.full_messages }, status: 422
    return @users
  end
  private

  def order_params
    params.require(:order).permit(:store_id, :sale, :user_id, :payment_type_id, :status, :data, :id_user)
  end
end