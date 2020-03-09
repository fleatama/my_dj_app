class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.string :youtube_url

      t.timestamps
    end
  end
end
