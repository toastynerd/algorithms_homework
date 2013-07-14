#!/usr/bin/env ruby
def get_inversions(array)
  unless array.size <= 2
    get_inversions(array[0..(array.size/2)])
    get_inversions(array[(array.size/2+1)..array.size])
  else
    unless array.size < 2
      if array[0] > array[1]
        @num_inversions += 1
      end
    end
  end
end

@my_numbers = ARGF.readlines
@num_inversions = 0
get_inversions(@my_numbers)
puts @num_inversions

