class CardsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!, :set_category, :set_cards
  before_action :payjp_api, exept: [:new]
  
  def new
    if @cards.exists?
      redirect_to card_path(@cards.first.id)
    end
  end

  def create
    customer = Payjp::Customer.create(card: params[:payjp_token])
    @card = Card.new(
      user_id:     current_user.id, 
      customer_id: customer.id, 
      card_id:     customer.default_card
    )
      if @card.save
        redirect_to root_path
      else
        redirect_to new_user_card_path(current_user)
      end
  end

  def show
    if @cards.blank?
      redirect_to action: new
    else
      card = @cards.first
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card_info = customer.cards.retrieve(card.card_id)
    end
  end

  def destroy
    if @cards.blank?
      redirect_to action: new
    else
      card = @cards.first
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  private
  def set_category
    @parents = Category.where(ancestry: nil)
  end

  def payjp_api
    Payjp.api_key = Rails.application.credentials[:payjp_secret_key]
  end

  def set_cards
    @cards = current_user.cards
  end

end
