class Message < ApplicationRecord
  belongs_to :user

  scope :pending, -> { where(delivered: false) }
end
