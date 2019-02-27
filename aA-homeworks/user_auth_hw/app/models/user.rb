class User < ApplicationRecord
  validates :username, :session_token, presence: true 
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true}
  before_validation :ensure_session_token
 
  attr_accessor :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    return user if BCrypt::Password.new(user.password_digest).is_password?(password)
    nil
  end 

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end 

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end 

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end 

  def password=(arg)
    @password = arg 
    self.password_digest = BCrypt::Password.create(password)
  end 

end
