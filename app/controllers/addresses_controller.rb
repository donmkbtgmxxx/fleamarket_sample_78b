class AddressesController < ApplicationController
  def edit
    @parents = Category.where(ancestry: nil)
    @address = current_user.address
  end

  def update
    @address = current_user.address
    if @address.update(address_params)
      redirect_to root_path, notice: '届け先住所を変更しました。'
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postcode, :prefecture_id, :city, :block, :building, :tel).merge(user_id: current_user.id)
  end

end
