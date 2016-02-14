class User < ActiveRecord::Base
	include RatingAverage
	has_many :ratings, dependent: :destroy   # käyttäjällä on monta ratingia
	has_many :beers, through: :ratings
	has_many :memberships, dependent: :destroy
	has_many :beer_clubs, through: :memberships

	has_secure_password
	validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :password, length: { minimum: 4 },
	format: { with: /\d.*[A-Z]|[A-Z].*\d/,
	message: "has to contain one number and one upper case letter"}

	def favorite_beer
	return nil if ratings.empty?
	ratings.order(score: :desc).limit(1).first.beer
	end
end
