class Poll < ApplicationRecord
  has_many :numbers, dependent: :destroy
  has_many :participation_tokens, dependent: :destroy
  after_create :generate_participation_tokens

  validates :name, :participants, presence: true
  validates :participants, numericality: true

  def number_histogram
    results = numbers.map(&:hours)
    #byebug
    max = results.empty? ? 0 : results.max + 1
    histogram = Array.new(max,0)
    results.each {|r| histogram[r] = histogram[r]+1}
    histogram
  end

  def generate_participation_tokens
    participants.times do
      participation_tokens.create(participation_key: SecureRandom.urlsafe_base64)
    end
  end

  def valid_participation_token?(token)
    participation_tokens.where(participation_key: token).any?
  end

  def register_answer(record)
    tokens = participation_tokens.where(participation_key: record.participation_key)
    if tokens.any?
      tokens.first.destroy
      return true
    else
      return false
    end
  end
end
