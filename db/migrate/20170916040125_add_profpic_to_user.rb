class AddProfpicToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profpic, :string
  end
end
