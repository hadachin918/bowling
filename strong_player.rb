class StrongPlayer < Player
  
  def knock(remain_count)
    rand(2) == 0 ? remain_count : rand(remain_count+1)
  end
  
end