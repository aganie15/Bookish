class Book < ApplicationRecord
  has_many :copies, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, length: { minimum: 10 }
end
