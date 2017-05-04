class UserMailer < ApplicationMailer
  default from: "briandelacruz408@gmail.com"

  def new_user(user)
    @user = user
    mail(to:@user.email, subject: "Welcome! you've registered at Blocipedia")
  end

end
