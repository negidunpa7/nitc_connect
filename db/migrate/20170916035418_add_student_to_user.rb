class AddStudentToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :student, :boolean
  end
end
