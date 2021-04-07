class AdminUsersController < ApplicationController

  layout 'admin'

  # before_action :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      flash[:notice] = 'Admin user created successfully.'
      redirect_to(admin_users_path)
    else
      render('new')
    end
    # debugger
  end

  def update
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
    logger.debug("*** Testing the logger. ***")
      redirect_to admin_users_path, notice: 'Admin user created successfully.'
    else
      render action: 'edit'
    end
  end

  def edit
    @admin_user = AdminUser.find_by(params[:id])
  end

  def delete
    @admin_user = AdminUser.find_by(params[:id])
  end

  def destroy
    if session[:user_id].to_i == params[:id].to_i
      flash[:notice] = 'Cannot delete your own account'
    else
      AdminUser.find(params[:id]).destroy
      flash[:notice] = 'Admin user deleted'
    end

    redirect_to action: 'index'

    # @admin_user.destroy
    # redirect_to admin_users_path, notice: 'Admin user destroyed successfully.'

    # @admin_user.destroy
    # respond_to do |format|
    #   format.html { redirect_to admin_users_path, notice: "Admin user destroyed successfully." }
    #   format.json { head :no_content }
    # end
  end

  private

  def set_user
    @admin_user = AdminUser.find_by(params[:id])
  end

  def admin_user_params
    # Permit :password, but NOT :password_digest
    params.require(:admin_user).permit(
      :first_name,
      :last_name,
      :email,
      :username,
      :password,
    )
  end
end

