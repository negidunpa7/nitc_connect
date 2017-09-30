class AddLastnotiToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lastnoti, :timestamp
  end
end
