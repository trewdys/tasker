class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_session
      t.timestamp :last_login

      t.timestamps
    end
  end
end
