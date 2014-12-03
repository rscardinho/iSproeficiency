class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.references :student
      t.references :course

      t.timestamps
    end
  end
end
