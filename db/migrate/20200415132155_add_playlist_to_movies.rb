class AddPlaylistToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :playlist, :text
  end
end
