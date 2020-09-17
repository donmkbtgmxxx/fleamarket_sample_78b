class RemoveBirthyearFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :birth_year_id, :integer
  end
end
