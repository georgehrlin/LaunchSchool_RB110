def bouncy?(n)
  return false if (n.to_s.size < 3)

  initial_d = nil
  current_d = nil

  arr_n = n.to_s.chars

  (0...arr_n.size - 1).each do |i|
    if initial_d == nil
      if arr_n[i] > arr_n[i + 1]
        initial_d = 'down'
      elsif arr_n[i] < arr_n[i + 1]
        initial_d = 'up'
      end

    else
      if arr_n[i] > arr_n[i + 1]
        current_d = 'down'
      elsif arr_n[i] < arr_n[i + 1]
        current_d = 'up'
      end

      if initial_d != current_d
        return true
      end
    end
  end
end

p bouncy?(1221) == true
p bouncy?(2112) == true
p bouncy?(121) == true
p bouncy?(212) == true
p bouncy?(1121) == true
p bouncy?(2212) == true

p bouncy?(111) == false
p bouncy?(12) == false
p bouncy?(21) == false
p bouncy?(123) == false
p bouncy?(321) == false
p bouncy?(112) == false
p bouncy?(221) == false
p bouncy?(1111) == false
p bouncy?(1223) == false
p bouncy?(3221) == false
p bouncy?(0) == false