class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :tourist_id
      t.integer :guide_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
