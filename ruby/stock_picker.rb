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

# loop through each element with index
#   loop through each element with index
#     if y_index > x_index && y > x
#       difference = y - x
#       if differene > max_revenue
#         max_revenue = difference



# sell = 10000
# sell_id = 0
# buy = 0
# buy_id = 0
# if price smaller? than sell and id bigger? than sell_id
#   save in variable as sell
#   save id in sell_id
# if price bigger? than buy and id bigger? than buy_id
#   save in var. as buy
#   save id in buy_id
  