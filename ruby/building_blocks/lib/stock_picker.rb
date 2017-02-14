def highest_revenue(stock_prices)
  max_revenue = 0
  stock_prices.each_with_index do |lower, lower_index|
    stock_prices.each_with_index do |higher, higher_index|
      if higher_index > lower_index && higher > lower
        difference = higher - lower
        difference > max_revenue ? max_revenue = difference : difference
      end
    end
  end
  max_revenue
end

def best_days_to_buy(stock_prices)
  best_days = []
  max_revenue = 0
  stock_prices.each_with_index do |lower, lower_index|
    stock_prices.each_with_index do |higher, higher_index|
      if higher_index > lower_index && higher > lower
        difference = higher - lower
        difference > max_revenue ? max_revenue = difference : difference
        if difference == max_revenue
          best_days[0] = lower_index
          best_days[1] = higher_index
        end
      end
    end
  end
  best_days
end

p best_days_to_buy([17,3,6,9,15,8,6,1,10])
# p highest_revenue([17,3,6,9,15,8,6,1,10])
# p highest_revenue([30,3,6,9,15,8,6,2,10,1])
  