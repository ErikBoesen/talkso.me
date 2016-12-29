class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update]
    before_action :correct_user,   only: [:edit, :update]

    # Only temporary.
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:username])
        redirect_to root_url and return unless @user.activated?
        @posts = @user.posts.paginate(page: params[:page])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # Handle a successful save.
            @user.send_activation_email
            flash[:success] = "Check your email for a link to activate your account."
            redirect_to root_url
        else
            render 'new'
        end
    end

    def update
        @user = User.find(params[:username])
        if @user.update_attributes(user_params)
            # Handle a successful update.
            flash[:success] = "Your profile has been updated."
            redirect_to @user
        else
            render 'edit'
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
        end

        # Confirms the correct user.
        def correct_user
            @user = User.find(params[:username])
            redirect_to(root_url) unless current_user?(@user)
        end
end