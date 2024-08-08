class DropFeatureFlags < ActiveRecord::Migration[7.2]
  def change
    drop_table :feature_flags
  end
end
