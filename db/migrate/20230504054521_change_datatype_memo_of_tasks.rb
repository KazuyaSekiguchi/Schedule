class ChangeDatatypeMemoOfTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :memo, :text
  end
end
