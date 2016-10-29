class CreateParticipationTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :participation_tokens do |t|
      t.string :participation_key
      t.references :poll, foreign_key: true

      t.timestamps
    end
  end
end
