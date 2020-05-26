class UsersController < ApplicationController
    
  def show
    @user = User.find(params[:id])
    @reservations = @user.reservations
  end

  def new
    @user = User.new
  end
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "La modification de votre compte est terminée."
      redirect_to @user
    else
      render 'edit'
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Vous pouvez maintenant effectuée des réservations de chambres #{@user.username}."
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
