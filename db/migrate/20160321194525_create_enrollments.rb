class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :username
      t.string :coursename

      t.timestamps null: false
    end
  end
end
