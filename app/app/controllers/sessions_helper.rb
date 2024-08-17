# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in?
    !current_user.nil?
  end

  def log_out
    sessions.delete(:user_id)
    @current_user = nil
  end
end
