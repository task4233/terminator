class Task < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 128 }
end
