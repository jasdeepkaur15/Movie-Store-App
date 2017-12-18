class Movie < ApplicationRecord
	mount_uploader :image, ImageUploader
	is_impressionable
	has_many :comments
	has_many :users, through: :comments
end
