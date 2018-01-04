class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :auth_token, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  before_validation :generate_auth_token, if: 'auth_token.blank?'

  def regenerate_auth_token!
    generate_auth_token
    save
  end

  private

  def generate_auth_token
    loop do
      self.auth_token = Devise.friendly_token
      break unless Admin.exists?(auth_token: auth_token)
    end
  end

end
