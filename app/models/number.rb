class Number < ApplicationRecord
  belongs_to :poll
  validates :poll, :hours, presence: true
  validates_with PollValidator
end
