class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.belongs_to :learning_goal, null: false, foreign_key: true
      t.boolean :done, null: false, default: false
      t.string :title, null: false, default: ''
      t.date :due

      t.timestamps
    end
  end
end
