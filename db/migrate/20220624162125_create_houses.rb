class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :realty_link
      t.integer :guest_capacity
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
