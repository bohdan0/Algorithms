# You will be given a list of stock prices for a given day and your goal is to return the maximum profit that could have been made by buying a stock at the given price and then selling the stock later on. For example if the input is: [45, 24, 35, 31, 40, 38, 11] then your program should return 16 because if you bought the stock at $24 and sold it at $40, a profit of $16 was made and this is the largest profit that could be made. If no profit could have been made, return -1.

def stock_picker(stocks)
    max_profit = 0
    min_val = stocks.first
    stocks.each do |val|
        min_val = val if val < min_val
        max_profit = val - min_val if val - min_val > max_profit
    end

    max_profit == 0 ? -1 : max_profit
end