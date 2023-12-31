class DiaryEntriesController < ApplicationController
  before_action :set_diary_entry, only: [:show, :edit, :update]

  def index
    @diary_entries = DiaryEntry.all
                               .order(date: :desc)
                               .page(params[:page])
  end

  def show; end

  def new
    @diary_entry = DiaryEntry.new(date: Date.today)
  end

  def create
    @diary_entry = DiaryEntry.new(diary_entry_params)
    @diary_entry.user = helpers.current_user

    if @diary_entry.save!
      redirect_to @diary_entry, notice: t(".created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @diary_entry.update(diary_entry_params)
      redirect_to @diary_entry, notice: t(".updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_diary_entry
    @diary_entry = DiaryEntry.find(params[:id])
  end

  def diary_entry_params
    params.require(:diary_entry).permit(
      :notes,
      :date,
      :pain_level,
      :energy_level,
      :mental_alertness_level,
      :work_stress_level,
      :life_stress_level,
      :sleep_quality_level,
      :weight,
    )
  end
end
