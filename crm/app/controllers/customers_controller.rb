class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  #Customerコントローラーにbefore_actionを定義し、show/edit/destroy/updateの共通処理をまとめてください
  #コールバック：アクションメソッドの外側に書く､アクション前に実施する宣言
  # すべてのアクションの前でメソッドが呼び出されるため､indexページのようなidを保持しないページに対しても動作するため､例外を付与
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  #アクセス制限をかけるコマンド
  #onlyオプションで制限を緩和

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
      :email,
      :company_id
      )
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def full_name
    full_name = family_name + given_name + ' 様'
    return full_name
  end


end
