class User < ApplicationRecord
  has_many :todos, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :psid, uniqueness: true

end
