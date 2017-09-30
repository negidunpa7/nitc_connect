class AddFlagcountToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :flagcount, :integer,default: 0
  end
end
