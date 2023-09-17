# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show]

  def index
    @microposts = helpers.current_user.microposts
  end

  def new
    @micropost = Micropost.new
  end

  def create
    micropost = Micropost.new(micropost_params)
    micropost.user = helpers.current_user
    if micropost.save
      redirect_to micropost, notice: t(".created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def micropost_params
    params.require(:micropost).permit(
      :content,
    )
  end

  def set_micropost
    @micropost = Micropost.find(params[:id])
  end
end
