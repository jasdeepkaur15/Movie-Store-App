class UserMailer < ApplicationMailer

	default from: 'notifications@example.com'
	
	def welcome_email(user)
    @user = user
    @url  = 'http://192.168.3.3:3000/movies'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
