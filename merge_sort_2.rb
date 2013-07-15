#!/usr/bin/env ruby

def merge_sort(array)
  temp_array = []
  left_side =[]
  right_side = []
  if array.size <= 1
    temp_array = array
  else
    array[0..(array.size/2-1)].each do |item|
      left_side << item
    end
    array[(array.size/2)..array.size].each do |item|
      right_side << item
    end
    temp_array = merge(merge_sort(left_side),merge_sort(right_side))
  end
  temp_array
end

def merge(left,right)
  merged = []
  @i = 0
  @j = 0
  while(@i < left.size || @j < right.size)
    if @i == left.size
      merged << right[@j]
      @j += 1
    elsif @j == right.size
      merged << left[@i]
      @i += 1
    elsif left[@i] <= right[@j]
      merged << left[@i]
      @i += 1
    else 
      merged << right[@j]
      @j += 1
      @num_inversions += left.size - @i
    end
  end
  merged
end
@num_inversions = 0
@my_numbers = []

ARGF.readlines.each do |item|
  @my_numbers << item.to_i
end
@sorted = merge_sort(@my_numbers)
print @sorted
puts ""
puts @num_inversions
