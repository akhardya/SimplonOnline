class LessonsController < ApplicationController

  def index
    if current_user.remote?
      @lessons = Lesson.online
    else
      @lessons = Lesson.all
    end
  end

  def new
  end

  def create
    lesson = Lesson.new(lesson_params)
    lesson.save!
    redirect_to action: :index
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    lesson = Lesson.find(params[:id])
    lesson.update_attributes(lesson_params)
    lesson.save!
    redirect_to lesson_path(lesson)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :online, :description)
  end
end
