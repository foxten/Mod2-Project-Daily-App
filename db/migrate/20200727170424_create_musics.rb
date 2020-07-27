class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.string :title
      t.string :playlist
      t.string :artist
      t.string :time_of_song

      t.timestamps
    end
  end
end
