class UserMailer < ApplicationMailer
  		default from: 'no-reply@KiteHouseProject.fr'
 
  def welcome_email(user)
    
    @user = user 
    @url  = 'http://monsite.fr/login' #enter the url path to join the login page
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
end

