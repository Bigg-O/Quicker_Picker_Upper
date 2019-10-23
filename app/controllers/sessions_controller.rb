class SessionsController < ApplicationController
    def new
        @user = User.new
        
    end
    def create
        @user = User.find_by(user_name: user_params[:user_name])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to users_path notice: "Logged in!"
        else
            
            # flash.now[:alert] = "Email or password is invalid"
            @user ||= User.new
            render :new
        end
    end

    
    def destroy
        session.delete :user_id
        redirect_to login_path 
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
    
end