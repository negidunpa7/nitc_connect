class RemoveProfpicFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :profpic, :boolean
  end
end
