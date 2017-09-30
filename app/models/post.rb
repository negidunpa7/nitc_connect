class Post < ApplicationRecord
 belongs_to :user 
 has_many :comments,:dependent => :destroy
 has_many :upvotes, :dependent => :destroy
 #has_many :posttagnews, :dependent => :destroy
 has_many :posttags, :dependent => :destroy
 has_many :flags, :dependent => :destroy
 has_attached_file :photo, styles: { medium: "400x400", thumb: "50x50" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
 #has_many :posttags
 #has_many :tags , :through => :posttags
end
