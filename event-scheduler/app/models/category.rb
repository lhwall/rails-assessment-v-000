class Category < ActiveRecord::Base
  has_many :events
  has_many :users, through: :events
  validates :name, length: {minimum: 1}
end
