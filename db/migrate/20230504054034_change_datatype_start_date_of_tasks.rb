class ChangeDatatypeStartDateOfTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :start_date, :date
  end
end
