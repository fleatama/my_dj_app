class CreateMoviePlaylistRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_playlist_relations do |t|
      t.integer :movie_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
