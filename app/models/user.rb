class User < ActiveRecord::Base
  has_many :items

  validates :username, presence: true, uniqueness: true
  has_secure_password
end
