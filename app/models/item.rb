class Item < ActiveRecord::Base
  belongs_to :user
  validates :list_item, presence: true

  def success_rate
    all = Session.where(user_id: user.id).where("created_at > ?", created_at)
    checked = all.select{|s| s.checkoffs.map{|c| c.item}.include?(self)}.length
    all = all.length == 0 ? 1 : all.length

    ((checked.fdiv(all)) * 100).round
  end

  def checked?
    session = Session.today(user)
    checked_off = user.checkoffs.select{|c| c.session_id == session.id}
    checked_off = checked_off.map{|c| Item.find_by(id: c.item_id)}
    checked_off.include?(self)
  end
end
