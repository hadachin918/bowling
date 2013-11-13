class LastFrame < Frame
  
  def get_remain_count
    @throws.size == 0 ? PIN_COUNT : PIN_COUNT - @throws.reduce(:+) % PIN_COUNT
  end
  
  def is_strike?
    @throws.size == 3 and @throws[0] == PIN_COUNT
  end
  
  def is_spare?
    @throws.size == 3 and @throws[0] != PIN_COUNT and @throws[0] + @throws[1] == PIN_COUNT
  end
  
  def is_open?
    @throws.size == 2 and @throws[0] != PIN_COUNT and @throws[0] + @throws[1] != PIN_COUNT
  end
  
end