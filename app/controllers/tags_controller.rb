# frozen_string_literal: true

class TagsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_tag, only: [:show]

  def index
    @tags = Tag.all
               .page(params[:page])
  end

  def show; end

  private

  def set_tag
    @tag = Tag.find_by(name: params[:id])
  end
end
