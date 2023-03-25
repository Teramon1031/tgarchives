class ApplicationController < ActionController::Base
    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_user
        current_user
        if @current_user == nil
            redirect_to('/admin/login')
        end
    end
end
