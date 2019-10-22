class UsersController < ApplicationController

    def index
        #new game and stats
    end

    def show
        redirect_to :index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id]
            redirect_to :index
        else
            render :new
        end

    end


    private

    def user_params
        params.require(:user).permit(:user_name, :password_confirmation)
    end
end
