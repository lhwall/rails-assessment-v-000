class User < ActiveRecord::Base
  has_many :events
  has_many :categories, through: :events
has_secure_password
validates :username, presence: true
validates :password, presence: true
validates :username, uniqueness: true
validates :password, confirmation: true

end
