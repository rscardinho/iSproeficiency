class StudentsController < ApplicationController
  before_filter :fetch_student

  def new
    @student = Student.new
  end

  def create
    respond_to do |format|
      if @student.update_attributes(student_params)
        format.html { redirect_to student_path(@student) }
      else
        format.html { render action: :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update_attributes(student_params)
        format.html { redirect_to student_path(@student) }
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @student.destroy
        format.html { redirect_to root_path }
      else
        format.html { redirect_to student_path(@student) }
      end
    end
  end

  private
    def student_params
      if params[:student]
        params.require(:student).permit(:name, :register_number, :status)
      else
        {}
      end
    end

    def fetch_student
      @student = params[:id].present? ? Student.find(params[:id]) : Student.new
    end
end