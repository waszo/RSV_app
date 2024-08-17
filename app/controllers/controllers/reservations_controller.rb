# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @room = Room.find(params[:id])
    @user_id = current_user.id
    @usr = User.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])

    if @reservation.save
      flash[:notice] = '予約が完了しました'
      redirect_to :rooms
    else
      flash[:alert] = '予約に失敗しました'
      render 'rooms/show'
    end
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.invalid?
      render 'reservations/confirm'
    else
      flash[:alert] = '予約情報を正しく記入してください'
      render 'rooms/show'
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :check_in, :check_out, :people, :price)
  end
end
