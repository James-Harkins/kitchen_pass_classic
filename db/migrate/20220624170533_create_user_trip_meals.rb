class CreateUserTripMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_trip_meals do |t|
      t.references :user, foreign_key: true
      t.references :trip_meal, foreign_key: true

      t.timestamps
    end
  end
end
