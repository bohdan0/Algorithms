def make_change(amt, coins = [1,5,10], cache = {0 => 0})
  return cache[amt] if cache[amt]
  coins.each do |coin|
    next if coin > amt
    prev = make_change(amt - coin, coins, cache)
    if prev
      curr = prev + 1
      cache[amt] = curr if !cache[amt] || cache[amt] > curr
    end
  end

  cache[amt]
end