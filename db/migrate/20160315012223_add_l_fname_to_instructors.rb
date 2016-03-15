class AddLFnameToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :first, :string
    add_column :instructors, :last, :string
  end
end
