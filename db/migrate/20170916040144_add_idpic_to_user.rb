class AddIdpicToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :idpic, :string
  end
end
