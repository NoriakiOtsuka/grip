class ChangeNameToTourists < ActiveRecord::Migration[5.2]
	def up
		change_column :tourists, :first_name, :string, null: false
		change_column :tourists, :last_name, :string, null: false
		change_column :tourists, :birthday, :date, null: false
		change_column :tourists, :gender, :integer, null: false
		change_column :tourists, :nationality, :string, null: false
		change_column :tourists, :phone, :string, null: false
		change_column :tourists, :status, :integer, null: false, default: 0
	end

	def down
		change_column :tourists, :first_name, :string
		change_column :tourists, :last_name, :string
		change_column :tourists, :birthday, :date
		change_column :tourists, :gender, :integer
		change_column :tourists, :nationality, :string
		change_column :tourists, :phone, :string
		change_column :tourists, :status, :integer, default: 0
	end
end
