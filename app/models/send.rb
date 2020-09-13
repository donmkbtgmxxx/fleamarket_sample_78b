class Send < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :prefecture, presence: true

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

end
