class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.string :name
      t.text :description
      t.boolean :instant_result
      t.boolean :public_result
      t.true :open
      t.string :answer_type

      t.timestamps
    end
  end
end
