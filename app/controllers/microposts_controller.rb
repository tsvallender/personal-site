# frozen_string_literal: true

class MicropostsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  def index
    @microposts = Micropost.all
                           .order(created_at: :desc)
                           .page(params[:page])
  end

  def new
    @micropost = Micropost.new
  end

  def create
    micropost = Micropost.new(micropost_params)
    micropost.user = helpers.current_user
    micropost.add_tags(params[:tags])
    if micropost.save
      redirect_to micropost, notice: t(".created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @micropost.update(micropost_params)
      redirect_to @micropost, notice: t(".updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @micropost.destroy
      redirect_to microposts_path, notice: t(".deleted")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def parse_tags(tags)
    tags.split
  end

  def micropost_params
    params.require(:micropost).permit(
      :content,
    )
  end

  def set_micropost
    @micropost = Micropost.find(params[:id])
  end
end
