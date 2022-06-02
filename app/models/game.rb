class Game < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy

  validates :title, presence: true
  validates :brand, presence: true
  validates :daily_rent, presence: true
  validates :console, presence: true
  validates :min_rent_period, presence: true

  # added for ManiGames Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
