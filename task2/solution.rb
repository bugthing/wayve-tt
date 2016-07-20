module Task2
  def longest_string(hash)
    hash.values.reduce('') { |longest, v| v.to_s.length > longest.length ? v : longest }
  end
  module_function :longest_string
end
