class CreateExerciseTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_types do |t|
      t.text :name, null: false
      t.text :unit, null: false

      t.timestamps
    end
  end
end
