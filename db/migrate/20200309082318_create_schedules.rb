class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :tourist_id
      t.integer :guide_id
      t.date :plan
      t.integer :status, default: 0

      t.timestamps null: false
    end
    add_index :schedules, :plan
  end
end
