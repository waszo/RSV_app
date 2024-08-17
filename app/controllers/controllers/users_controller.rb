# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    @user = current_user
    @user.profile_image.attach(params[:profile_image])
    @user.name = params[:name]
    @user.introduction = params[:introduction]

    if @user.update(profile_image: params[:profile_image], name: params[:name], introduction: params[:introduction])
      flash[:notice] = '変更が完了しました'
      redirect_to :rooms
    else
      flash[:alert] = '変更に失敗しました'
      render 'users/profile'
    end
  end

  def account
    @user = User.find_by(id: params[:id])
  end

  def profile
    @user = User.find_by(id: params[:id])
  end

  def edit_profile
    @user = User.find_by(id: params[:id])
  end
end
