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

  validates :password,
            confirmation: true,
            length: { in: 12..300 },
            presence: true,
            if: :validate_password?

  validates :password_confirmation,
            presence: true,
            if: :validate_password?

  def to_param
    username
  end

  def full_name
    "#{first_name} #{last_names}"
  end

  private

  def validate_password?
    new_record? || password_digest_changed?
  end
end
