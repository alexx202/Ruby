range = ("а".."я").to_a
array = ["а", "е", "и", "о", "у", "ы", "э", "ю" , "я"]
hash = {}

array.each do |letter|
  hash[letter] = range.find_index(letter) + 1
end
p hash
