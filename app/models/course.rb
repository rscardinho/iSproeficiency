class Course < ActiveRecord::Base
  has_many :students, through: :classroom
  has_many :classroom

  validates :name, :description, :status, presence: true

  def linked_at(student)
    self.classroom.find_by_student_id(student.id).created_at.strftime('%d/%m/%Y às %H:%M')
  end
end