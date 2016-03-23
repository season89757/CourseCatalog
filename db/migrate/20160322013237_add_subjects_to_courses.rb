class AddSubjectsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_id, :string
    add_column :courses, :subjects, :string
  end
end
