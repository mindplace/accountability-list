class Item < ActiveRecord::Base
  belongs_to :user
  validates :list_item, presence: true

  def success_rate
    all = Session.where(user_id: user.id).where("created_at > ?", created_at)
    checked = all.select{|s| s.include?(self)}.length
    all = all.length == 0 ? 1 : all.length
    
    ((checked.fdiv(all)) * 100).round
  end
end
