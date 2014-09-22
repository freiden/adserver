class UsersController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: %i(new create index)

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_user_path(@user), notice: "User was successfuly created." }
      else
        format.html { render :edit }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: "User was successfuly updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to advertisers_url, notice: 'User was successfully destroyed.' }
    end
  end

private
   # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation)
    en

end