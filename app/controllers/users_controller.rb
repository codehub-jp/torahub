class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.order(id: :desc).page(params[:page]).per(25)
    end

    def show
        #プロフィール表示
        @user = User.find(params[:id])

        #Boardへの投稿内容を表示
        @boards = @user.boards.order(id: :desc).page(params[:page])
        counts(@user)

    end

    def new
        @user = User.new
    end

    def create
        #ユーザー登録
        @user = User.new(user_params)

        if @user.save
            flash[:success] = '登録が完了いたしました。'
            redirect_to @user
        else
            flash.now[:danger] = '申し訳ございません。登録に失敗いたしました。'
            render :new
        end

    end

    def edit
        #プロフィール編集
        @user = User.find(params[:id])
    end

    def update
        #プロフィール修正後の保存
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def destroy
        #退会機能の実装
        @user = User.find(params[:id])
        @user.destroy
        reset_session
        redirect_to users_url, notice: '退会が完了しました。ご利用ありがとうございました。'
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
