class AddNameToGuides < ActiveRecord::Migration[5.2]
	def change
		add_column :guides, :first_name, :string
		add_column :guides, :last_name, :string
		add_column :guides, :birthday, :date
		add_column :guides, :gender, :integer
		add_column :guides, :address, :text
		add_column :guides, :phone, :string
		add_column :guides, :introduction, :text
		add_column :guides, :region, :string
		add_column :guides, :profile_image_id, :string
		add_column :guides, :status, :integer, default: 0

		add_index :guides, :first_name
		add_index :guides, :last_name
	end
end
