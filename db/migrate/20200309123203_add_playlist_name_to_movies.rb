class AddPlaylistNameToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :playlist_name, :text
  end
end
