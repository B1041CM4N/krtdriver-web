class ApiController < ApplicationController
  layout false
  protect_from_forgery with: :null_session

  skip_before_action :verify_authenticity_token
end
