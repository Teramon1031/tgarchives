class ApplicationController < ActionController::Base
    before_action :logged_in?

    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def logged_in?
        current_user
        if @current_user == nil
            @logged_in = false
        else
            @logged_in = true
        end
    end

    def authenticate_user
        current_user
        if @current_user == nil
            redirect_to('/admin/login')
        end
    end
end
