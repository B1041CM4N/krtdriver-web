class Api::UsersController < ApiController
    def index
        if (params[:mail] && params[:pass]).present?
            #rand_id = Random.rand(2.3).to_i.abs
            #@user = User.find(rand_id)
            @user = User.first
        else
            render json: { errors: @user.errors.full_messages }, status: 422
        end
    end

    private

    def users_params
        params.require(:users).permit(:mail, :pass, :user_id, :id_user)
    end
end