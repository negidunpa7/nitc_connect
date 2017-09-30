class Removecolumnprofilepic < ActiveRecord::Migration[5.1]
  def change
   remove_column:users,:profilepic
   remove_column:users,:idpic
  end
end
