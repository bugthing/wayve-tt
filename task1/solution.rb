module Task1
  def palindrome?(word)
    (word.length / 2).times do |i|
      opposite_idx = word.length - i - 1
      return false unless word.chars[i] == word.chars[opposite_idx]
    end
    true
  end
  module_function :palindrome?
end
