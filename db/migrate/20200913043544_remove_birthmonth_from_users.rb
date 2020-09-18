class RemoveBirthmonthFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :birth_month_id, :integer
  end
end
