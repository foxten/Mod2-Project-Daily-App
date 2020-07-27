class CreateUserMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :user_musics do |t|
      t.integer :user_id
      t.integer :music_id
    end
  end
end
