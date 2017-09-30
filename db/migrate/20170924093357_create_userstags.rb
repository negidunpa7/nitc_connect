class CreateUserstags < ActiveRecord::Migration[5.1]
  def change
    create_table :userstags do |t|
      t.integer :user_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
