class User < ActiveRecord::Base
  has_many :items
  has_many :sessions
  has_many :checkoffs, through: :sessions

  validates :username, presence: true, uniqueness: true
  has_secure_password

end
