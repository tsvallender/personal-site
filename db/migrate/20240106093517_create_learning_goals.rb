class CreateLearningGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :learning_goals do |t|
      t.string :title, null: false
      t.date :starts_on
      t.date :ends_on
      t.boolean :completed, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
