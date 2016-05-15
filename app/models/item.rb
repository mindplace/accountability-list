class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :list_item, presence: true
end
