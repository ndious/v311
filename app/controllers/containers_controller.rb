# typed: strict

##
# @TODO rename room into container
# RoomsController activate room related actions
##
class ContainersController < ApplicationController
  before_action :save_code, only: [:create]

  def index
    @rooms = Container.find_by customer: @user

    render json: @rooms || []
  end

  def show
    @room = Room.find_by! code: params.require(:room).permit(:code)
  end

  def new; end

  def create
    @vault = Vault.find_by! customer: @user
    @room = Room.new(name: room_params[:name], customer: @user, vault: @vault, room_code: @room_code)

    if @room.save
      render json: @room, status: :created
    else
      render json: { errors: @room.errors }, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

  def save_code
    @room_code = Code.generate_code

    @code = Code.new scope: 'room', customer: @user, value: @room_code
    render json: { errors: @code.errors }, status: :unprocessable_entity unless @code.save
  end
end
