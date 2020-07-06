class MoviePlaylistRelation < ApplicationRecord
  belongs_to :movie
  belongs_to :playlist
end
