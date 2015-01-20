class Admin < ActiveRecord::Base
  before_save :create_remember_token
  has_secure_password
  validates :name, :password, presence: true

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
