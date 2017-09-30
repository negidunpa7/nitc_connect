class Addphototopost < ActiveRecord::Migration[5.1]
  def up
    add_attachment :posts, :photo
  end
 
  def down
    remove_attachment :posts, :photo
  end
end
