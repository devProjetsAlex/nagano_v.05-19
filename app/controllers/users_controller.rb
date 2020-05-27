class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def show
    
    @reservations = @user.reservations
  end

  def new
    @user = User.new
  end
  def index
    @users =  User.paginate(page: params[:page], per_page: 3)
  end

  def edit
    
  end

  def update
    
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

  def set_user
    @user = User.find(params[:id])
  end

end
