class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.text :description
      t.integer :user_session

      t.timestamps
    end
  end
end
