class User < ApplicationRecord
  include ActiveModel::Serializers::JSON

  has_secure_password
  has_secure_token

  has_many :projects
  has_many :tasks

  validates :email, uniqueness: true

  def invalidate_token
    update(token: nil)
  end

  def self.valid_login?(email, password)
    user = find_by(email: email)
    user&.authenticate(password)
  end
end
