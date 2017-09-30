class Sdfsdfs < ActiveRecord::Migration[5.1]
 def change
  rename_column :posts, :upvotes, :upvotecount
  end
end
