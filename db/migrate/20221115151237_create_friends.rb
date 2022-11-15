class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :city
      t.string :country
      t.text :description
      t.string :img_url
      t.belongs_to :user, null:false, foreign_key:true

      t.timestamps
    end
  end
end
