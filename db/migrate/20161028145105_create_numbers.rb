class CreateNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :numbers do |t|
      t.integer :hours
      t.string :participation_key
      t.references :poll, foreign_key: true

      t.timestamps
    end
  end
end
