class Student < ActiveRecord::Base
  has_many :courses, through: :classroom
  has_many :classroom

  validates :name, :register_number, :status, presence: true

  def linked_at(course)
    self.classroom.find_by_course_id(course.id).created_at.strftime('%d/%m/%Y às %H:%M')
  end
end