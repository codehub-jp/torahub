class ApplicationController < ActionController::Base
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
