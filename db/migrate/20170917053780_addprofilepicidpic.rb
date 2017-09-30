class Addprofilepicidpic < ActiveRecord::Migration[5.1]
  def up
    add_attachment :users, :profilepic
  end
 
  def down
    remove_attachment :users, :profilepic
  end
  
  def up
    add_attachment :users, :idpic
  end
 
  def down
    remove_attachment :users, :idpic
  end
  
end
