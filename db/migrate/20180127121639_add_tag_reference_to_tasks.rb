class AddTagReferenceToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :tag, foreign_key: true
  end
end
