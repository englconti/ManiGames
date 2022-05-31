class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rents
  has_many :games

  # Needs to include validation for characters with REGEX:
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  # Check if this will work to define rolls for the user when renting or advertising:
  # validates :role, inclusion: { in: %w[owner renter nil] }
end

#      invoke  active_record
#      create    db/migrate/TIMESTAMP_devise_create_users.rb
#      create    app/models/user.rb
#      insert    app/models/user.rb
#       route  devise_for :users
