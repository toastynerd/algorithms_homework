#!/usr/bin/env ruby

@my_numbers = ARGF.readlines
@num_inversions = 0

@i = 0
puts "starting"

while @i < @my_numbers.size
  @j = @i + 1
  while @j < @my_numbers.size
    if @my_numbers[@j] > @my_numbers[@i]
      @num_inversions += 1
    end
    print "."
    @j += 1
  end
  puts "@"
  @i += 1
end

puts @num_inversions
