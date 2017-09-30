class CreateUsertags < ActiveRecord::Migration[5.1]
  def change
    create_table :usertags do |t|
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
