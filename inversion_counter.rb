#!/usr/bin/env ruby
@num_inversions = 0
def merge_sort(array)
  temp_array = []
  left_half = []
  right_half = []
  if array.size > 2
    array[0..(array.size/2 - 1)].each do |item|
      left_half << item
    end
    array[(array.size/2)..(array.size)].each do |item|
      right_half << item
    end
    left_half =  merge_sort(left_half)
    right_half = merge_sort(right_half)
  elsif array.size == 2
    left_half << array[0]
    right_half << array[1]
    if right_half[0] > left_half[0]
      @num_inversions += 1
    end
  else
    right_half << array[0]
    @num_inversions += 1
  end
  temp_array = merge(left_half,right_half)
  temp_array

end

def merge(left_side, right_side)
  merged_array = []
  if left_side.empty?
    merged_array << right_side.shift
  elsif right_side.empty?
    merged_array << left_side.shift
  else
    while(!left_side.empty?)
      unless right_side.empty?
        if(left_side[0] < right_side[0])
          merged_array << left_side.shift
        else
          @num_inversions += 1
          merged_array << right_side.shift
        end
      else
        merged_array <<  left_side.shift
      end
    end

    while(!right_side.empty?)
      @num_inversions += 1
      merged_array << right_side.shift
    end
  end

  merged_array
end
@my_numbers = []

ARGF.readlines.each do |item|
  @my_numbers << item.to_i
end
@sorted = merge_sort(@my_numbers)
print @sorted
puts ""
puts @num_inversions
