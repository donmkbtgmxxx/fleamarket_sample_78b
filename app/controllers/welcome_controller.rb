class WelcomeController < ApplicationController
  
  
  def mypage
    @parents = Category.where(ancestry: nil)
  end
end
