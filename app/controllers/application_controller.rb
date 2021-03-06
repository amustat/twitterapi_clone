class ApplicationController < ActionController::API
    before_action :set_current_user
  
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_user
        if @current_user == nil
            render json: Init.message(500, e.message), status: 500
        end
    end
      
end
