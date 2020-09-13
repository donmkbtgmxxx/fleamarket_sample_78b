class SendsController < ApplicationController

  def new
    @send = Send.new
  end

  def create
    @send = Send.new(send_params)
    if @send.save
      redirect_to root_path, notice: '送付先情報を登録しました'
    else
      render :new
    end
  end

  private
  def send_params
    params.require(:send).permit(
      :family_name_kanji, 
      :first_name_kanji, 
      :family_name_kana, 
      :first_name_kana, 
      :postcode, 
      :prefecture_id, 
      :city, 
      :block, 
      :building, 
      :tel
    ).merge(user_id: current_user.id)
  end
end
