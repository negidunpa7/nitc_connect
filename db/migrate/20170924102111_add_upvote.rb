class AddUpvote < ActiveRecord::Migration[5.1]
  def change
  	 add_column :posts, :upvotes, :integer , default: 0
  end
end
