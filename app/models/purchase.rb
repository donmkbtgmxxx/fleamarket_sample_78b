class Purchase < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true
  validates :item_id, :user_id, presence: true
end
