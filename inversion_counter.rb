#!/usr/bin/env ruby
def get_inversions(array)
  unless array.size == 2
    get_inversions(array[0..(array.size/2)])
    get_inversions(array[(array.size/2+1)..array.size])
  else
    puts "blerg"
  end
end

@my_numbers = ARGF.readlines
@num_inversion = 0
get_inversions(@my_numbers)

