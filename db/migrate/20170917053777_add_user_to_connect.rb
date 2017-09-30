class AddUserToConnect < ActiveRecord::Migration[5.1]
  def change
    add_reference :connects, :user, foreign_key: true
  end
end
