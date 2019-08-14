class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  validates :category, uniqueness: true, presence:true
  validates :reviews, inclusion: { in: [1, 2, 3, 4, 5] }
end
