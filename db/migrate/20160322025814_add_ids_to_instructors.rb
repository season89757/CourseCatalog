class AddIdsToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :instructor_id, :string
    remove_column :instructors, :name, :string
  end
end
