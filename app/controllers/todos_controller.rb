class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy]

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo.learning_goal, notice: t(".created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit ; end

  def update
    if @todo.update(todo_params)
      redirect_to @todo.learning_goal, notice: t(".updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    learning_goal = @todo.learning_goal
    if @todo.destroy
      redirect_to learning_goal, notice: t(".deleted")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(
      :learning_goal_id,
      :description,
      :done,
      :title,
      :due,
    )
  end
end
