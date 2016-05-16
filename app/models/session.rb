class Session < ActiveRecord::Base
  belongs_to :user
  has_many :checkoffs

  def self.today(user)
    session = self.where("created_at >= ?", Date.today).where("user_id = ?", user.id)
    session.nil? || session.empty? ? self.create(user_id: user.id) : session.last
  end
end
