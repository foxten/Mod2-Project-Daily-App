class CreateSleepingPatterns < ActiveRecord::Migration[6.0]
  def change
    create_table :sleeping_patterns do |t|
      t.string :location
      t.integer :average_sleep
      t.string :position
      t.integer :grade
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
