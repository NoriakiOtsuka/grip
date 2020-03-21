class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :tourist, foreign_key: true
      t.references :guide, foreign_key: true
      t.references :schedule, foreign_key: true
      t.text :message, null: false
      t.boolean :sender, null: false, default: false

      t.timestamps
    end
  end
end
