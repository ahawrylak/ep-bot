class Todo < ApplicationRecord
  belongs_to :user

  MAX_LIFETIME = 1.week.freeze

  scope :older_than, ->(time) { where('created_at < ?', time.ago) }
end
