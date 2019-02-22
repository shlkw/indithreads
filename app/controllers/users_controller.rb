class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

def new 
  @user = User.new
end 

  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def create
  @user = User.new(user_params)
    if @user.save
      redirect_to user_path(user.id)
  else
     flash[:message] = "User was not created"
     redirect_to signup_path
  end
end

  def edit
  end



def update 
  if @user.update(user_params)
    redirect_to user_path(@user)
  else 
    flash[:message] = "User was not updated"
    render "edit"
  end 
end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :avatar_img)
    end


end
