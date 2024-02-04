class CreateFeatureFlags < ActiveRecord::Migration[7.0]
  def change
    create_table :feature_flags do |t|
      t.string :name, null: false, index: { unique: true }
      t.boolean :enabled, null: false, default: false

      t.timestamps
    end
  end
end
