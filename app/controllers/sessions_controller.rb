class SessionsController < ApplicationController
   
    
    
    skip_before_action :authorize

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(user_name: user_params[:user_name])
        
        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            redirect_to '/main'
        else
            if @user
            @user.errors.add(:password, :wrong_password, message: "is incorrect.")
            else 
                @message = "That user name does not exist."
            end
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