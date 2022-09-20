class Copy < ApplicationRecord
  belongs_to :book

  validates :book_id, presence: true
  validates :borrower, presence: true
  validates :due_date, presence: true
end
