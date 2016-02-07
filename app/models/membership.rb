class Membership < ActiveRecord::Base
belongs_to :beer_club
belongs_to :user

	def to_s
		"#{beer_club.name} #{beer_club.city}"
	end
end
