class AccessController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  def menu
    # display text & link 
  end



  


  def login
    # login form 
    flash[:notice] = "Please log in"
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).second
      found_user = AdminUser.where(:username => params[:username]).first
      
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        
      end
    end


    def admin_users_new
      @admin_user = AdminUser.new(admin_user_params)
      if @admin_user.save
        redirect_to admin_users_path, notice: 'Admin user created successfully.'
      else
        render('new')
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in"
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end


  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    render(access_login_path)
  end




end
