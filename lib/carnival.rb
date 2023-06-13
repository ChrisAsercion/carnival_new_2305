class Carnival
  attr_reader :duration, :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    most_frequented_ride = @rides.max_by do |ride|
      ride.amount_of_riders
    end
  end

  #This was my first attempt at most_popular_ride which I determined inadequate because it was checking
  #the all the rides the visitor had taken up to that point. A helper accumulator(amount_of_riders) was added to ride.rb to easily get through this

  # def most_popular_ride
  #   most_frequented_ride = @rides.max_by do |ride|
  #     ride.rider_log.values.sum
  #   end
  # end

  def most_profitable_ride
    highest_profit_ride = @rides.max_by do |ride|
      ride.total_revenue
    end
  end

  def total_revenue
    carnival_revenue = 0
    @rides.each do |ride|
      carnival_revenue += ride.total_revenue
    end
    carnival_revenue
  end

  def summarize
    summary = Hash.new(0)
    visitors = []
    ride_info = []
    rides.each do |ride|
      ride.rider_log.each do |visitor|
        visitors << visitor
      end
    end
    summary[:visitor] = visitors.uniq.length
    #I was trying to account for a way to get around the chance that a visitor goes on 2 different rides.
    #I was spending a lot of time on it, so I decided to move on to further detail the hash
    summary[:revenue_earned] = self.total_revenue
    summary[:visitors] = []
    summary[:rides] = []
    visitors.each do |visitor|
      info = Hash.new(0)
      info[:visitor] = visitor[0]
      #info[:favorite_ride]
      #info[:total_money_spent] = visitor[1]
    end
    rides.each do |ride|
      info = Hash.new(0)
      info[:ride] = ride
      info[:riders] = []
      ride.rider_log.each do |visitor|
        info[:riders] << visitor
      end
      summary[:rides] << info
      info[:total_revenue] = ride.total_revenue
    end 
  end
end