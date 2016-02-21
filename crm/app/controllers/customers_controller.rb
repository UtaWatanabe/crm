class CustomersController < ApplicationController
  before_action :set_customer
  #コールバック：アクションメソッドの外側に書く､アクション前に実施する宣言

  def index
    @customers = Customer.all
    @customers = Customer.page(params[:page])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      # =>  成功
      redirect_to @customer
      else
      # =>  失敗
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      # => 成功
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @customer.destroy
    redirect_to @customer
  end

  private

  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email
      )
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
