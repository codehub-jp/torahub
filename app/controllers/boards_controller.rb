class BoardsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @board = current_user.boards.build(board_params)
      if @board.save
        flash[:success] = 'メッセージを投稿しました。'
        redirect_to root_url
      else
        @boards = current_user.boards.order(id: :desc).page(params[:page])
        flash.now[:danger] = 'メッセージの投稿に失敗しました。'
        render 'toppages/index'
      end
  end

  def destroy
    @board.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def board_params
    params.require(:board).permit(:content)
  end

  def correct_user
    @board = current_user.boards.find_by(id: params[:id])
    unless @board
      redirect_to root_url
    end
  end
end
