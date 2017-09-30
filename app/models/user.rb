class User < ApplicationRecord
  has_many:posts
 has_many :comments,:dependent => :destroy
 has_many :upvotes, :dependent => :destroy
 #has_many :posttagnews, :dependent => :destroy
 has_many :flags, :dependent => :destroy
 has_many :userstags , :dependent => :destroy
before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 3 }

  has_attached_file :profilepic, styles: { medium: "300x300", thumb: "70x70" }
  validates_attachment_content_type :profilepic, content_type: /\Aimage\/.*\Z/
  
  has_attached_file :idpic, styles: { medium: "300x300", thumb: "70x70" }
  validates_attachment_content_type :idpic, content_type: /\Aimage\/.*\Z/

end
