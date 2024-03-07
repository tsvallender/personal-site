# frozen_string_literal: true

class HomePagesController < ApplicationController
  skip_before_action :require_login

  def index
    @latest_blog_post = BlogPost.published.order(created_at: :desc).first
  end
end
