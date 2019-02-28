class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user #set ivar to take in from controller
    @url = 'http://logincats.com/session/new'
    #assume our users' emails are their usernames
    mail(to: user.username, subject: 'Welcome to 99 cats!')
  end 

end
