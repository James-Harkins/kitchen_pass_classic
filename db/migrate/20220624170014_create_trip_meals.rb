class CreateTripMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_meals do |t|
      t.datetime :date
      t.float :cost_per_person
      t.references :trip, foreign_key: true
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
