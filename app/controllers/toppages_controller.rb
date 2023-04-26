class ToppagesController < ApplicationController
    def index
        if logged_in?
          @board = current_user.boards.build  # form_with 用
          @boards = current_user.boards.order(id: :desc).page(params[:page])
        end
    end
end
