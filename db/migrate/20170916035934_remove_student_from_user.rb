class RemoveStudentFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :student, :boolean
  end
end
