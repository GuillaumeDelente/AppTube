class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :apps

  before_save :ensure_tokens
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def ensure_tokens
    if user_token.blank?
      self.user_token = generate_user_token
      self.secret_token = Devise.friendly_token
    end
  end

  def generate_user_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(user_token: token).first
    end
  end
end
