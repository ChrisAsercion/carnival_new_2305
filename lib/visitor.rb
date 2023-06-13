class Visitor
  attr_reader :name, :height, :preferences
  attr_accessor :times_rode, :spending_money, :money_spent

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$').to_i
    @preferences = []
    @times_rode = 0
    @money_spent = 0
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(required_height)
    if self.height >= required_height
      true
    else
      false
    end
  end
  
end