class User < ActiveRecord::Base

  after_create :send_confirm_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # def send_devise_notification(notification, *args)
  #   devise_mailer.send(notification, self, *args).deliver_later
  # end

  private

  def send_confirm_email
    UserMailer.new_user(self).deliver_now

  end

end
