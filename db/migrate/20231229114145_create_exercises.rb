class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.references :exercise_type, null: false, foreign_key: true
      t.time :at
      t.float :amount, null: false

      t.timestamps
    end
  end
end
