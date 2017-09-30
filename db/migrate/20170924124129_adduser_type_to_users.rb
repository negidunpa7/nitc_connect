class AdduserTypeToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :userType, :string
  	add_column :users, :yearOfEnrollment, :string
  	add_column :users, :areasOfInterest, :string
  end
end
