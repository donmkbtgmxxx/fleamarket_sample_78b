class WelcomeController < ApplicationController
before_action :authenticate_user!, :set_category
  def index
  end

  def set_category
    @parents = Category.where(ancestry: nil)
  end
end
