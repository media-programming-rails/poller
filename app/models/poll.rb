class Poll < ApplicationRecord
  has_many :numbers #, dependent: :destroy
  has_many :participation_tokens, dependent: :destroy
  after_create :generate_participation_tokens

  validates :name, :participants, presence: true
  validates :participants, numericality: true


  def generate_participation_tokens
    participants.times do
      participation_tokens.create(participation_key: SecureRandom.urlsafe_base64)
    end
  end
end
