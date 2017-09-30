class Posttag < ApplicationRecord
	belongs_to :posts
	belongs_to :tags
end
