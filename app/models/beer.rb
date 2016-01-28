class Beer < ActiveRecord::Base
 belongs_to :brewery
  has_many :ratings

	def average_rating
		sum = 0
		ratings.each do |r| 	
			sum = sum + r.score
		end
		sum / ratings.count.to_f
	end

	def to_s
		"#{name} - #{brewery.name}"
	end
end
