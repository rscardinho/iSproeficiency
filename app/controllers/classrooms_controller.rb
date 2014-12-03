class ClassroomsController < ApplicationController
  before_filter :fetch_student, only: [:student, :fetch_students]
  before_filter :fetch_course, only: [:course, :fetch_courses]

  def fetch_students
    @student.courses = Course.find(params[:courses][:ids]) rescue []
    respond_to do |format|
      format.html { redirect_to student_path(@student) }
    end
  end

  def fetch_courses
    @course.students = Student.find(params[:students][:ids]) rescue []
    respond_to do |format|
      format.html { redirect_to course_path(@course) }
    end
  end

  private
    def fetch_student
      @student = Student.find(params[:id])
    end

    def fetch_course
      @course = Course.find(params[:id])
    end
end