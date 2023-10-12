# frozen_string_literal: true

require "securerandom"

class User < ApplicationRecord
  has_secure_password
  has_many :microposts
  has_many :blog_posts

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

  after_create :require_confirmation

  def to_param
    username
  end

  def full_name
    "#{first_name} #{last_names}"
  end

  def requires_confirmation?
    email_confirmation_string.present?
  end

  private

  def require_confirmation
    update(email_confirmation_string: SecureRandom.uuid)
    UserMailer.with(user: self).confirm_email.deliver_later
  end

  def validate_password?
    new_record? || password_digest_changed?
  end
end
