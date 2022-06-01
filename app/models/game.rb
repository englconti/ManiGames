class Game < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy

  validates :title, presence: true
  validates :brand, presence: true
  validates :daily_rent, presence: true
  validates :console, presence: true
  validates :min_rent_period, presence: true
end
