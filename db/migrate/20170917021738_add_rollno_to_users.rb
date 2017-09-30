class AddRollnoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rollno, :string
  end
end
