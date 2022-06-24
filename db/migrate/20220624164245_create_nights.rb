class CreateNights < ActiveRecord::Migration[5.2]
  def change
    create_table :nights do |t|
      t.datetime :date
      t.string :cost_per_person
      t.string :float
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
