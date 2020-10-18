class PurchasesController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!, :set_category, :set_cards, :set_item
  before_action :payjp_api, exept: [:new]
  
  def new
    if @cards.exists?
      @purchase = Purchase.new
      card = @cards.first
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card_info = customer.cards.retrieve(card.card_id)
      @address = Address.where(user_id: current_user.id).take
    else
      redirect_to new_card_path
    end
  end

  def create
    charge = Payjp::Charge.create(
      :amount => @item.price,
      :customer => current_user.cards.first.customer_id,
      :currency => 'jpy'
    )

    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to root_path
    else
      redirect_to item_confirmation_path(@item.id)
    end

  end

  private

  def set_category
    @parents = Category.where(ancestry: nil)
  end

  def payjp_api
    Payjp.api_key = Rails.application.credentials[:payjp_secret_key]
  end

  def set_cards
    @cards = Card.where(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

end
