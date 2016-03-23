class AddSegmentsToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :subject_id, :string
    add_column :subjects, :segments, :string
  end
end
