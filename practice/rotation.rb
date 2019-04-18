# Write a method that rotates an array by moving the first element
# to the end of the array. The original array should not be modified.

# Write a method that can rotate the last n digits of a number.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

## rotate_array method
## ===================
## input: array
## output: array (not the same object)
## rules
##   Explicit:
##    -Original array must not be modified
##    -May not use Array#rotate or Array#rotate!
##   Implicit:
##    -Because original array should not be modified, either clone original
##     or use a non-mutating method.
## algorithm:
##   -Initialize shallow copy of the given array (so not to modify original)
##   -Remove the value of the element at index 0 and return the value to a var
##   -Append the value of the new var to the end of the copied array
##   -Return the rotated array

## rotate_rightmost_digits method
## ===============================
## input: integer, integer
## output: integer
## rules
##   Explicit:
##    -The integer n is always a positive integer
##   Implicit:
##    -Rotating just 1 digit returns the original array, (because the last 
##     digit rotates around itself). This implies that rotating the last n 
##     digits of an integer is the same as rotating an array of digits where
##     each element of the array is a digit and n the digit power (i.e. 10^n).
## algorithm:
##   -Convert the number into a string
##   -Split the string into an array of digits
##   -Identify the digit around which to rotate
##   -Create two subarrays, the digits before n and the digits after and 
##    including n
##   -Rotate the second subarray (using rotate_array)
##   -Append the rotated subarray to the first subarray (ensuring to flatten
##    the ensuing array)
##   -Join the subarrays, convert to integer and return the integer


def rotate_array(arr)
    place_holder = arr.clone
    x = place_holder.slice!(0)
    place_holder.push(x)
end

def split_digits(num)
    number = num.to_s
    number.chars
end

def sub_arrays(start, num, n)
    digits = split_digits(num)
    sub_arr1 = digits[start, digits.length - n]
    sub_arr2 = digits[-n, digits.length]
    [sub_arr1, sub_arr2]
end

def rotate_rightmost_digits(num, n)
    arr1 = sub_arrays(0, num, n)[0]
    arr2 = sub_arrays(0, num, n)[1]
    digits = arr1.push(rotate_array(arr2))
    digits.join.to_i
end



# Example:

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true