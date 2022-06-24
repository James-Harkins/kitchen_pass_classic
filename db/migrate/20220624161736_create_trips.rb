class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :year
      t.float :total_cost
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
