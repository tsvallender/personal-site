# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username,
            :first_name,
            :last_names,
            :email,
            presence: true

  validates :email,
            :username,
            uniqueness: { case_sensitive: false }

  validates :email,
            format: { with: /\A.*@.*\..*\z/ } # Only very basic regex

  validates :password, confirmation: true
end
