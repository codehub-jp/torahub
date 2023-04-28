class ApplicationController < ActionController::Base

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    private

    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end

    def counts(user)
        @count_boards = user.boards.count
    end
end
