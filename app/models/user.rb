class User < ApplicationRecord
  PASSWORD_RESET_TOKEN_EXPIRATION = 10.minutes

  before_save :downcase_email

  has_many :active_sessions, dependent: :destroy

  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  def generate_password_reset_token
    signed_id expires_in: PASSWORD_RESET_TOKEN_EXPIRATION, purpose: :reset_password
  end

  def send_password_reset_email!
    password_reset_token = generate_password_reset_token
    UserMailer.password_reset(self, password_reset_token).deliver_now
  end

  private

    def downcase_email
      self.email = email.downcase
    end
end
