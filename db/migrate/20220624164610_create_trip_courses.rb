class CreateTripCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_courses do |t|
      t.float :total_cost
      t.float :cost_per_person
      t.references :trip, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
