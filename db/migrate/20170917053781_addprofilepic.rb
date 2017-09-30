class Addprofilepic < ActiveRecord::Migration[5.1]
  def change
  remove_column:users,:profilepic
   add_attachment :users, :profilepic
  end
end
