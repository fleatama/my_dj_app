class Movie < ApplicationRecord
  belongs_to :user
  belongs_to :playlists
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
end
