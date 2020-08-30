class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    redirect_to user_feed_path(user_id: current_user.id ,id: current_user.feed.id) if logged_in?
  end

  def create
    @user = login(params[:email].downcase, params[:password])
    return failed_login unless @user
    redirect_to user_feed_path(user_id: current_user.id, id: current_user.feed.id)
  end

  def destroy
    logout
    flash[:warning] = "Logged out!"
    redirect_to new_user_sessions_path
  end

  def failed_login
    @failed_login = true
    render action: 'new'
  end
end
