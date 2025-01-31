=begin
PEDAC for cards_total
P
Input: An array of strings that represent a hand of cards
Output: Numeric total of all the cards

Implicit:
- The value of an ace ('ca', 'da', 'ha', 'sa') is determined by the total of
  the cards
  - If the total < 21, the ace is worth 11
    - Which means there can be scenarios with multiple aces but only one of
      them is worth 11, and the rest 1
  - If the total > 21, the ace (or aces) is worth 1 instead

E
cards_total(['sa'])                    # => 11
cards_total(['ca', 'ha'])              # => 12
cards_total(['ca', 'h4', 's6'])        # => 21
cards_total(['ca', 'h4', 'sa', 's6'])  # => 22
cards_total(['s10', 'd6', 'c2', 's9']) # => 27
cards_total(['cj', 'dk', 'sq'])        # => 30
cards_total(['ca', 'cj', 'sq', 'sa'])  # => 22

D
Input: An array of strings
Intermediate: Integers, an array of integers
Output: An integer

A
General:
- If one ace is present in cards
  - If total > 21
    - Ace's value is 1
  - Else if total < 21
    - Ace's value is 11

- If multiple aces are present in cards
  - If total > 21
    - If total < 21 when first ace's value is 11
      - First ace's value is 11, rest are 1
    - If total > 21 when first ace's value is 11
      - All aces' values are 1

Specific:
- Use convert_cards_to_face_vals to convert cards into an arr of cards' face
  vals (no suits) and assign to a var, face_vals
- Initialize a var, first_ace_in_cards?, that points to true
- Initialize a var, numeric_vals, that points to []
- Loop over face_vals
  - If encounters first 'a', translate to numeric val of 11
    - Then set first_ace_in_cards? to false
    - If encounter more 'a's
      - Use first_ace_in_cards? == false as checking condition totranslate
        their numeric vals to 1
  - Translate each face val to numeric val and append to numeric_vals

  - Calculate total
    - If total > 21 AND first_ace_in_cards? == true
      - Return total
    - Else if total > 21 AND first_ace_in_cards? == false
      - Set first 'a''s numeric val to 1
      - Return total
=end

def cards_total(cards)
  face_vals = convert_cards_to_face_vals(cards)
  numeric_vals = face_vals_to_numeric_vals(face_vals)

  numeric_vals[numeric_vals.index(11)] = 1 if numeric_vals.sum > 21 &&
                                              numeric_vals.include?(11)

  numeric_vals.sum
end

=begin
"Corrective" mechanism to change first ace's value to 1 when total > 21
- If cards' total > 21
  - First ace's value becomes 1 instead
- Recalculate and return sum

=end

def convert_cards_to_face_vals(cards)
  cards.map { |card| card[1..-1] }
end

def face_vals_to_numeric_vals(face_vals)
  first_ace = true
  face_vals.map do |face_val|
    if face_val == 'a'
      if first_ace
        first_ace = false
        11
      else
        1
      end
    elsif ['j', 'k', 'q'].include?(face_val)
      10
    else
      face_val.to_i
    end
  end
end

cards1 = ['s10', 'd6', 'c2', 's9']
cards2 = ['ca', 'h4', 's6']
cards3 = ['cj', 'dk', 'sq']
cards4 = ['sa']
cards5 = ['ca', 'ha']
cards6 = ['ca', 'h4', 'sa', 's6']
cards7 = ['ca', 'cj', 'sq']

p convert_cards_to_face_vals(cards1)
p convert_cards_to_face_vals(cards2)
p convert_cards_to_face_vals(cards3)
p convert_cards_to_face_vals(cards4)
p convert_cards_to_face_vals(cards5)
p convert_cards_to_face_vals(cards6)
p convert_cards_to_face_vals(cards7)


p cards_total(cards1) # => 27
p cards_total(cards2) # => 21
p cards_total(cards3) # => 30
p cards_total(cards4) # => 11
p cards_total(cards5) # => 12
p cards_total(cards6) # => 12
p cards_total(cards7) # => 21
