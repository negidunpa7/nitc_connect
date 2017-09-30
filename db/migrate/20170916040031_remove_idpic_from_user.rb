class RemoveIdpicFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :idpic, :boolean
  end
end
