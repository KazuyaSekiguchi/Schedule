class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :start_date
      t.string :end_date
      t.string :all_day
      t.string :memo

      t.timestamps
    end
  end
end
