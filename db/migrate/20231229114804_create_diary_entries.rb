class CreateDiaryEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :diary_entries do |t|
      t.text :notes, null: false, default: ''
      t.date :date, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :pain_level, null: false
      t.integer :energy_level, null: false
      t.integer :mental_alertness_level, null: false
      t.integer :work_stress_level, null: false
      t.integer :life_stress_level, null: false
      t.integer :sleep_quality_level, null: false

      t.timestamps
    end
  end
end
