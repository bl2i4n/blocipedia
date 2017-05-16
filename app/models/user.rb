class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  before_save { self.role ||= :standard }

  has_many :collaborators
  has_many :wikis, through: :collaborators

  enum role: [:standard, :premium, :admin]

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
