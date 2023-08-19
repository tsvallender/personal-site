# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def confirm_email
    @user = params[:user]
    mail(to: @user.email, subject: t(".confirm_email"))
  end
end
