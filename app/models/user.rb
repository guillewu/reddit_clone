class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password

  validates :email, :session_token, :presence => true, :uniqueness => true
  validates :password_digest, :presence => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  before_validation { self.session_token = SecureRandom.urlsafe_base64(16) }

  has_many :subs, :foreign_key => :moderator_id, :inverse_of => :moderator

  has_many :links, :inverse_of => :user

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)

    return nil unless user

    user.is_password?(password) ? user : nil
  end


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
  end
end
