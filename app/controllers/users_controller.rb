class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find_by(username: params[:username])
    @post = @user.posts.build
    redirect_to root_url and return unless @user.activated?
    @posts = @user.posts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to li_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      # TODO: Make @user redirect to the right place
      redirect_to '/' + @user.username
    else
      render 'edit'
    end
  end

  def destroy
    User.find(current_user.id).destroy
    flash[:success] = "User deleted"
    redirect_to root_url
  end

  def following
    @title = "Following"
    @user  = User.find(current_user.id)
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(current_user.id)
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find_by(username: params[:username])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
