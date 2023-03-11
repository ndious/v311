# typed: strict

## Item controller
class ItemsController < ApplicationController
  before_action :save_code, only: [:create]

  def index
    @items = Item.find_by customer: @user

    render json: @items || []
  end

  def show; end

  def create
    @vault = Vault.find_by! customer: @user
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description).merge({ customer: @user, vault: @vault, room_code: @room })
  end

  def save_code
    @item_code = Code.generate_code

    @code = Code.new scope: 'item', customer: @user, value: @item_code
    render json: { errors: @code.errors }, status: :unprocessable_entity unless @code.save
  end
end
