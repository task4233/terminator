class Task < ApplicationRecord
  belongs_to :user
  default_scope -> { order(deadline: :asc) }
  validates :name, presence: true, length: { maximum: 128 }
  validates :deadline, presence: true
  validate  :validate_deadline if :created_at.nil?
  
  private
  def validate_deadline
    Date.now < self.deadline
  end
end
