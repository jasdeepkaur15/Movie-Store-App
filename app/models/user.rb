class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :comments
	has_many :movies, through: :comments

	after_create :send_admin_mail
 		 def send_admin_mail
  		  UserMailer.welcome_email(self).deliver_now
 		 end

end
