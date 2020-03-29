class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :tourist_id
      t.integer :guide_id
      t.string :title, null: false
      t.integer :region
      t.string :image_id
      t.text :body, null: false
      t.boolean :sender, null: false, default: false

      t.timestamps
    end
  end
end
