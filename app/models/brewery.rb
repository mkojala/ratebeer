class Brewery < ActiveRecord::Base
has_many :beers, dependent: :destroy
has_many :ratings, through: :beers

def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2016
    puts "changed year to #{year}"
  end
	def to_s
		"#{name}"
	end

	def average_rating
		sum = 0
		ratings.each do |r| 	
			sum = sum + r.score
		end
		sum / ratings.count.to_f
	end

end
