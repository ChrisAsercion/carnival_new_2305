require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe 'Carnival' do

  describe 'iteration 3' do
    it 'exists' do
      carnival1 = Carnival.new(14)
      expect(carnival1.duration).to eq(14)
      expect(carnival1.rides).to eq([])
    end

    it 'add rides' do
      carnival1 = Carnival.new(14)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)
      expect(carnival1.rides.length).to eq(3)
    end

    it 'can check the most popular ride' do
      carnival1 = Carnival.new(14)
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride2.board_rider(visitor3)
      ride2.board_rider(visitor3)
      ride3.board_rider(visitor3)
      ride3.board_rider(visitor3)
      expect(carnival1.most_popular_ride).to eq(ride1)
      expect(carnival1.most_popular_ride.name).to eq("Carousel")
    end

    it 'can check the most profitable ride' do
      carnival1 = Carnival.new(14)
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)
      ride3.board_rider(visitor3)
      expect(carnival1.most_profitable_ride).to eq(ride1)
    end

    it 'can sum the revenue from all rides' do
      carnival1 = Carnival.new(14)
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)
      ride1.board_rider(visitor1)
      ride2.board_rider(visitor1)
      ride2.board_rider(visitor1)
      ride3.board_rider(visitor3)
      expect(carnival1.total_revenue).to eq(8)
    end
  end

  describe 'iteration 4' do
    it 'can summarize the data' do
      carnival1 = Carnival.new(14)
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride3.board_rider(visitor3)
      carnival1.summarize
    end
  end
end 