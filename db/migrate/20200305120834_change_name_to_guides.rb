class ChangeNameToGuides < ActiveRecord::Migration[5.2]
	def up
		change_column :guides, :first_name, :string, null: false
		change_column :guides, :last_name, :string, null: false
		change_column :guides, :birthday, :date, null: false
		change_column :guides, :gender, :integer, null: false
		change_column :guides, :address, :text, null: false
		change_column :guides, :phone, :string, null: false
		change_column :guides, :status, :integer, null: false, default: 0
	end

	def down
		change_column :guides, :first_name, :string
		change_column :guides, :last_name, :string
		change_column :guides, :birthday, :date
		change_column :guides, :gender, :integer
		change_column :guides, :address, :text
		change_column :guides, :phone, :string
		change_column :guides, :status, :integer, default: 0
	end
end
