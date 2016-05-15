class User < ActiveRecord::Base
  has_many :items
  has_many :checkoffs

  validates :username, presence: true, uniqueness: true
  has_secure_password
end
