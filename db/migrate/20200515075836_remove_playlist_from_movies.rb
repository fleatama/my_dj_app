class RemovePlaylistFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :playlist, :text
  end
end
