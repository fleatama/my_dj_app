class MoviePlaylistRelation < ApplicationRecord
  belongs_to :user, optional:true
  belongs_to :playlist, optional: true
  belongs_to :movie, optional: true
  validates :user_id, presence:true
  validates :movie_id, presence:true
  validates :playlist_id, presence:true
end
