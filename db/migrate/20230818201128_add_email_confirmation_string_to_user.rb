class AddEmailConfirmationStringToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_confirmation_string, :uuid, default: nil
  end
end
