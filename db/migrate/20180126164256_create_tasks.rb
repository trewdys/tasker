class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
