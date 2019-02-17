# -*- coding: utf-8 -*-
class Task < ApplicationRecord
  belongs_to :user
  default_scope -> { order(deadline: :desc) }
  validates :name, presence: true, length: { maximum: 128 }
  validates :deadline, presence: true
  validate  :validate_deadline
  
  def validate_deadline
    if self.deadline.present? && Date.today > self.deadline
      errors.add(:deadline, ": 過去の日付は設定できません.")
    end
  end
end
