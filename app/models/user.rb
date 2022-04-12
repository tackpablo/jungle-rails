class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password, confirmation: true
  validates :password, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    user = User.where("LOWER(email) = LOWER(?)", email.strip).first

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
  
end
