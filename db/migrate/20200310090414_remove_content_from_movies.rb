class RemoveContentFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :content, :text
  end
end
