# frozen_string_literal: true

class LearningGoalsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_learning_goal, only: [:show, :edit, :update, :destroy]

  def index
    @learning_goals = LearningGoal.all
                                  .order(created_at: :desc)
                                  .page(params[:page])
  end

  def new
    @learning_goal = LearningGoal.new
  end

  def create
    @learning_goal = LearningGoal.new(learning_goal_params)
    @learning_goal.user = helpers.current_user

    if @learning_goal.save
      redirect_to @learning_goal, notice: t(".created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show ; end

  def edit; end

  def update
    if @learning_goal.update(learning_goal_params)
      redirect_to @learning_goal, notice: t(".updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @learning_goal.destroy
      redirect_to learning_goals_path, notice: t(".deleted")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def learning_goal_params
    params.require(:learning_goal).permit(
      :title,
      :starts_on,
      :ends_on,
      :description,
      :retrospective,
      :completed,
      :user,
    )
  end

  def set_learning_goal
    @learning_goal = LearningGoal.find(params[:id])
  end
end
