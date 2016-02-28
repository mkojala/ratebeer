class Brewery < ActiveRecord::Base
include RatingAverage
has_many :beers, dependent: :destroy
has_many :ratings, through: :beers
validates :name, presence: true
validates :year, numericality: { less_than_or_equal_to: Proc.new { Time.now.year } }
scope :active, -> { where active:true }
scope :retired, -> { where active:[nil,false] }
def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end
  def toggle_activity
    brewery = Brewery.find(params[:id])
    brewery.update_attribute :active, (not brewery.active)

    new_status = brewery.active? ? "active" : "retired"

    redirect_to :back, notice:"brewery activity status changed to #{new_status}"
  end
  def restart
    self.year = 2016
    puts "changed year to #{year}"
  end
	def to_s
		"#{name}"
	end

end
