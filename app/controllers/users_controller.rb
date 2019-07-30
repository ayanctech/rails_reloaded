class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @users=User.search(params[:search]).sort
    else
      @users=User.sorted
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), flash: { success: "User successfully created." }
    else
      render("new")
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), flash: { success: "user successfully updated." }
    else
      render("edit")
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, flash: { notice: "User was successfully destroyed." }

  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :search)
  end
end
