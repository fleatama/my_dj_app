class Playlist < ApplicationRecord
  belongs_to :user
  belongs_to :movies
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
end
