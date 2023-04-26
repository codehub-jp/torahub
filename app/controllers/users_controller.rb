class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.order(id: :desc).page(params[:page]).per(25)
    end

    def show
        #プロフィール関連
        @user = User.find(params[:id])

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
    end

    def update
        if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
        else
        render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to users_url, notice: 'User was successfully destroyed.'
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
