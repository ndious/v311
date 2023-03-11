# typed: false

## HomeController to manage all basics routing
class HomeController < ApplicationController
  skip_before_action :authenticate, only: %i[login sigin]

  def login; end

  def dashboard; end

  def search
    @code = Code.find_by value: params[:code_value].upcase, customer: @user

    return search_codes unless @code

    return show_container if @code.container?

    return show_item if @code.item?

    return show_code if @code.unassigned?

    render json: @code
  end

  def search_codes
    raw_code = params[:code_value]
    if raw_code.length == 6
      @code = Code.new value: raw_code, scope: Code.scopes[:unassign], customer: @user

      return show_code
    end

    @codes = Code.where(customer: @user).where('value LIKE ?', "%#{raw_code}%")

    render 'codes/list'
  end

  def show_code
    render 'codes/show'
  end

  def show_container
    @container = Container.find_by code: @code

    render 'containers/show'
  end

  def show_item
    @item = Item.find_by code: @code

    render 'items/show'
  end

  def print_sheet
    @codes = (1..42).collect{ Code.generate_code save: save_param, customer: @user }.map(&:value)
    @qrcodes = @codes.map do |code|
      RQRCode::QRCode.new code
    end

    send_data Sheet.new(@codes, @qrcodes).print, filename: 'sheet.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def sigin
    @customer = Cusomer.find_by login: sigin_params[:login]

    render json: @customer.except
  end

  private

  def sigin_params
    params.require(:customer).permit(:login)
  end

  def save_param
    return params[:save] == 'true' if params[:save]

    false
  end
end
