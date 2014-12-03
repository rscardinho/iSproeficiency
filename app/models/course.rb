class Course < ActiveRecord::Base
  validates :name, :register_number, presence: true
end