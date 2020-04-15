class RemovePlaylistNameFromPlaylists < ActiveRecord::Migration[5.2]
  def change
    remove_column :playlists, :playlist_name, :text
  end
end
