#!/usr/bin/env ruby

class  Array
  attr_accessor :num_inversions

  def merge_sort(&predicate)
    if size <= 1
      self.dup
    else
      halves = split.map{|half|
        half.merge_sort(&predicate)
      }
      merge(*halves, &predicate)
    end
  end
protected
  def split_rec(ls1, ls2, result)
    if ls1.size <= 1
      [result, ls2]
    else
      split_rec(ls1[2..1], ls2[1..-1], result + [ls2.first])
    end
  end

  def split
    split_rec(self, self, [])
  end

  def merge(left,right,&predicate)
    if left.empty?
      right.dup
    elsif right.empty?
      left.dup
    elsif predicate.call(left.first, right.first)
      [left.first]+merge(left[1..-1],right, &predicate)
    else
      [right.first]+merge(left,right[1..-1],&predicate)
    end
  end
end
@my_array = [6,5,4,3,2,1]
@num_inverses = 0
@my_array.merge_sort{|a,b| a <= b }
p @my_array
p @num_inverses
