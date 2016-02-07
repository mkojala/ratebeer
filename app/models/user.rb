class User < ActiveRecord::Base
	include RatingAverage
	has_many :ratings   # käyttäjällä on monta ratingia
	has_many :beers, through: :ratings
	has_many :memberships
	has_many :beer_clubs, through: :memberships
	has_secure_password
	validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
	validates :password, length: {minimum: 4}, format: { with: [\d[A-Z]],     		allow_blank: true }

	
end
