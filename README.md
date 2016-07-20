# Tech test

Here lies the explaination (see below) and solution to a tech test (see repo)

## Task 1:

Create a function that takes in a string and returns true if the string is a palindrome (e.g. is
identical if read from left to right and from right to left, for example “asa” and “abccba" are
palindromes, however “abca” is not) and false otherwise. Please do not use the string
method ‘reverse’.

    def palindrome? string
      # solution
    end

## Solution 1:

    $ ruby task1/tests.rb
    $ ruby task1/tryme.rb abccba

## Task 2:

Write a one line function that takes in a hash parameter, where all values of the hash are
strings, and the function returns the longest string in that hash.

    def longest_string hash
      # the one line solution
    end

## Solution 2:

    $ ruby task2/tests.rb

## Task 3:

When starting at the top of the pyramid and moving down the rows in sequential order, we
can make a path. The path can only be formed in a descending order and is created by
one of the numbers on either side of the previous number. For example, looking at
pyramid below, the path starts with the 4 at the top, meaning the second number can be
either the 7 or 4. If the 7 is chosen the third number can be either the 2 or 4 and if the 4 is
chosen the final number in the path can be either the 5 or 9. The maximum sum this
example can have is 24, as highlighted 4 + 7 + 4 + 9 = 24.

```
   4
  7 4
 2 4 6
8 5 9 3
```

Write a Ruby function that reads in a text file with an arbitrary triangle (similar to the one
above and using numbers between the range 1< x < 99) and outputs the maximum sum of
the path when moving from top to bottom.

Make sure the code is as clean as possible and takes care of all edge cases.

Can your function handle a triangle with 500 rows in less than a minute?

## Solution 3:

    $ ruby task3/tests.rb

    $ ruby task3/tryme.rb task3/example1.txt

    $ echo ' 4   \
            7 4  \
           2 4 6 \
          8 5 9 3' | ruby task3/tryme.rb

You can generate a pyramid for any number of rows like so:

	$ ruby task3/generate_pyramid.rb 5

So you can try out 500 lines like so:

	$ ruby task3/generate_pyramid.rb 500 | ruby task3/tryme.rb 

