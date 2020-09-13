class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.string :family_name_kanji,  null: false
      t.string :first_name_kanji,   null: false
      t.string :family_name_kana,   null: false
      t.string :first_name_kana,    null: false
      t.string :postcode,           null: false
      t.integer :prefecture_id,     null: false
      t.string :city,               null: false
      t.string :block,              null: false
      t.string :building
      t.string :tel
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
