class AddNameToTourists < ActiveRecord::Migration[5.2]
	def change
		add_column :tourists, :first_name, :string
		add_column :tourists, :last_name, :string
		add_column :tourists, :birthday, :date
		add_column :tourists, :gender, :integer
		add_column :tourists, :nationality, :string
		add_column :tourists, :phone, :string
		add_column :tourists, :status, :integer, default: 0

		add_index :tourists, :first_name
		add_index :tourists, :last_name
	end
end
