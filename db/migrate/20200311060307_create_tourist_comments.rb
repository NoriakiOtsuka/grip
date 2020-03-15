class CreateTouristComments < ActiveRecord::Migration[5.2]
  def change
    create_table :tourist_comments do |t|
      t.text :comment
      t.integer :tourist_id
      t.integer :guide_id

      t.timestamps
    end
  end
end
