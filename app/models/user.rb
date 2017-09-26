class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates :psid, uniqueness: true
end
