class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.date :date
      t.string :exception
      t.time :clock_in
      t.time :clock_out
      t.time :break_in
      t.time :break_out
      t.time :break_duration
      t.string :comment

      t.timestamps
    end
  end
end
