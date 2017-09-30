class CreateConnects < ActiveRecord::Migration[5.1]
  def change
    create_table :connects do |t|
      t.integer :user2id
      t.boolean :approved

      t.timestamps
    end
  end
end
