class CoursesController < ApplicationController
  before_filter :fetch_course

  def new
    @course = Course.new
  end

  def create
    respond_to do |format|
      if @course.update_attributes(course_params)
        format.html { redirect_to course_classroom_path(@course) }
      else
        format.html { render action: :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update_attributes(course_params)
        format.html { redirect_to course_classroom_path(@course) }
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @course.destroy
        format.html { redirect_to root_path }
      else
        format.html { redirect_to course_path(@course) }
      end
    end
  end

  private
    def course_params
      if params[:course]
        params.require(:course).permit(:name, :description, :status)
      else
        {}
      end
    end

    def fetch_course
      @course = params[:id].present? ? Course.find(params[:id]) : Course.new
    end
end