def stock_picker(stock_prices)
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

p stock_picker([17,3,6,9,15,8,6,2,10,1])
  