class Item < ActiveRecord::Base
  belongs_to :user

  validates :list_item, presence: true
end
