class Brewery < ActiveRecord::Base
include RatingAverage
has_many :beers, dependent: :destroy
has_many :ratings, through: :beers
validates :name, presence: true
validates :year, numericality: { less_than_or_equal_to: Proc.new { Time.now.year } }

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

end
