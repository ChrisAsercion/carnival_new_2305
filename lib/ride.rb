class Ride 
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log, :amount_of_riders


  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @total_revenue = 0
    @rider_log = {}
    @amount_of_riders = 0
  end

  def board_rider(rider)
    if rider.height > self.min_height && rider.spending_money >= self.admission_fee
      rider.times_rode += 1
      rider.spending_money = rider.spending_money - self.admission_fee
      rider.money_spent = rider.money_spent + self.admission_fee
      @total_revenue += self.admission_fee
      @amount_of_riders += 1
      @rider_log.store(rider, rider.times_rode)
    end
  end
end