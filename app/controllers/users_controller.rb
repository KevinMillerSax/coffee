class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user =  User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_url
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.create_activity :create, owner:@user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :equipment,
                                 :favorite_coffee, :location)
  end

  #before filters



  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
