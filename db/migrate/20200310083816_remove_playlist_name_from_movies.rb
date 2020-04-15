class RemovePlaylistNameFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :playlist_name, :text
  end
end
