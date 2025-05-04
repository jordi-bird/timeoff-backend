class CreateTimeOffRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :time_off_requests do |t|
      t.date :start_date
      t.date :end_date
      t.string :reason
      t.integer :status, default: 0
      t.references :employee, null: false, foreign_key: true
      t.timestamps
    end
  end
end
