class RemoveTeacherFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :teacher, :boolean
  end
end
