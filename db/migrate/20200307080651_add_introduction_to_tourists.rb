class AddIntroductionToTourists < ActiveRecord::Migration[5.2]
  def change
		add_column :tourists, :introduction, :text
		add_column :tourists, :profile_image_id, :string
  end
end
