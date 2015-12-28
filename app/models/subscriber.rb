class Subscriber < ActiveRecord::Base
  # User needs to accept subscription within 24 hours or token is invalid
  TOKEN_EXPIRATION_TIME = 24.hours

  attr_accessor :refresh_token

  before_save :reset_token_expires_at, :generate_token, if: :refresh_token

  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, 
    format: { with: /\A[^@]*@[^@]*\z/ } # Validates email to have one @

  def token_expired?
    self.token_expires_at < Time.now.utc
  end

  def reset_token_expires_at
    self.token_expires_at = Time.now.utc + TOKEN_EXPIRATION_TIME
  end

  def generate_token
    self.token = loop do
      random_token = SecureRandom.uuid.to_s.gsub('-', '')
      break random_token unless Subscriber.exists?(token: random_token)
    end
  end
end
