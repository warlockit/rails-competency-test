class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  access all: [], admin: :all

  def index
   @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: "User was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /packages/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice:  "User was successfully updated."}
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /packages/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :roles)
    end

end
