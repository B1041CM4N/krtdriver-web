class Api::OrdersController < ApiController
  def index
    if params[:id_user].present?
      rand_id = Random.rand(50)
      @user = User.find(1)
    end
  end
  private

  def order_params
    params.require(:order).permit(:store_id, :sale, :user_id, :payment_type_id, :status, :data, :id_user)
  end
end