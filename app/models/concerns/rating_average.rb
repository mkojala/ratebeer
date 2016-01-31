module RatingAverage
extend ActiveSupport::Concern

	def average_rating
		sum = 0
		ratings.each do |r| 	
			sum = sum + r.score
		end
		sum / ratings.count.to_f
	end

end
