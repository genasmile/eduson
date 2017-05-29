class GuestController < ApplicationController
  def index
    if session[:login_error]
      @login_error = true
      session[:login_error] = nil
    end
  end

  def authenticate
    @login = params[:login]
    @pass = params[:pass]
    user = User.authenticate @login, @pass
    if user
      remember_user user
      if user.user?
        return redirect_to user_index_path
      elsif user.admin?
        return redirect_to admin_index_path
      end
    else
      session[:login_error] = true
    end
    redirect_to guest_index_path
  end

  def logout
    session[:user_id] = nil
    redirect_to guest_index_path
  end

  private

  def remember_user user
    session[:user_id] = user.id
  end
end