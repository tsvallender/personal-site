# frozen_string_literal: true

class BlogPostsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = BlogPost.all.order(created_at: :desc)
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.user = helpers.current_user
    if @blog_post.save
      redirect_to @blog_post, notice: t(".created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    unless @blog_post.published || @blog_post.user == helpers.current_user
      redirect_to blog_posts_path, notice: t(".not_found")
    end
  end

  def edit; end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: t(".updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @blog_post.destroy
      redirect_to blog_posts_path, notice: t(".deleted")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(
      :title,
      :content,
      :published,
      :slug,
    )
  end

  def set_blog_post
    @blog_post = BlogPost.find_by(slug: params[:id])
  end
end
