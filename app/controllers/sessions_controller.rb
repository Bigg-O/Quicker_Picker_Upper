class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.find_by_username(params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to users_path notice: "Logged in!"
        else
            # flash.now[:alert] = "Email or password is invalid"
            render :new
        end
    end

    
    def destroy
        session.delete :name
        redirect_to login_path 
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
    
end