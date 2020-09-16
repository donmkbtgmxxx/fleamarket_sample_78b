class RemoveBirthdayFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :birth_day_id, :integer
  end
end
