require 'pry'

# Relates to the github Repo linked at the end of the readme: https://gist.github.com/alexgriff/0061bd3ff76c06341a62489899890b01

magazine = "Nourishing Hydrating Shampoo an antioxidant-packed shampoo that thoroughly cleans without stripping; Suits normal, dry, damaged, and color-treated hair. Both the shampoo and conditioner smell absolutely amazing, are extremely nourishing, and are completely toxin-free."

note = "if you want to see your doll again"

# Class Solve
def can_write_ransom_note(mag, note)
  magazine = mag.split.join.downcase
  ransome_note = note.split.join
  ransome_note.each_char do |char|
    if !magazine.include?(char)
        return false
    end
  end
  return true
end

# Nicky O(n^2) solve
def can_write_ransom_note_nicky(magazine, note)
  note_array = note.split("")
  magazine_array = magazine.split("")
  note_array.each do |letter|
    if index = magazine_array.find_index(letter)
      magazine_array.delete_at(index)
    else
      return false
    end
  end
  return true
end


# Nicky O(n) solve
def string_to_letter_hash(string)
  hash = {}
  string.split("").each do |letter|
    letter = letter.downcase
    if hash[letter]
      hash[letter] += 1
    else
      hash[letter] = 1
    end
  end
  return hash
end

def can_write_ransom_note_linear(magazine, note)
  magazine_hash = string_to_letter_hash(magazine)
  note_array = note.split("")
  note_array.each do |letter|
    letter = letter.downcase
    if !magazine_hash[letter] || magazine_hash[letter] < 1
      return false
    else
      magazine_hash[letter] -= 1
    end
  end
  return true
end

# Tests

test_mag = "twElVe"
test_string = "eel"
test_string2 = "eels"
test_string3 = "eeel"

puts(string_to_letter_hash(test_string2) === {"e"=>2, "l"=>1, "s"=>1})
puts(can_write_ransom_note_linear(test_mag, test_string))
puts(!can_write_ransom_note_linear(test_mag, test_string2))
puts(!can_write_ransom_note_linear(test_mag, test_string3))

puts(can_write_ransom_note_linear(magazine, note))
