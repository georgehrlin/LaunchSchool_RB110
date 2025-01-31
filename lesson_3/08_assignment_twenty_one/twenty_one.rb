SUITS = ['c', 'd', 'h', 's']
CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'a', 'j', 'k', 'q']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    CARDS.each do |card|
      deck << "#{suit}#{card}"
    end
  end

  deck
end

def display_cards(cards)
  prompt "#{cards}"
end

def display_one_dealer_card(dealer_cards)
  prompt "Dealer's card: #{dealer_cards[0]}"
end

def remove_a_card_from_deck!(card, deck)
  deck.delete(card)
end

def remove_cards_from_deck!(cards, deck)
  cards.each { |card| deck.delete(card) }
end

def deal_2_cards_from_deck!(deck)
  cards_dealt = []
  2.times do
    card_dealt = deck.sample
    remove_a_card_from_deck!(card_dealt, deck)
    cards_dealt << card_dealt
  end

  cards_dealt
end

def deal_1_card_from_deck!(deck)
  card_dealt = deck.sample
  remove_a_card_from_deck!(card_dealt, deck)
  prompt "Card dealt: #{card_dealt}"
  [card_dealt]
end

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

def cards_total(cards)
  face_vals = convert_cards_to_face_vals(cards)
  numeric_vals = face_vals_to_numeric_vals(face_vals)

  numeric_vals[numeric_vals.index(11)] = 1 if numeric_vals.sum > 21 &&
                                              numeric_vals.include?(11)

  numeric_vals.sum
end

def busted?(cards)
  cards_total(cards) > 21
end

loop do # main loop
  system('clear')
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  player_cards += deal_2_cards_from_deck!(deck)
  dealer_cards += deal_2_cards_from_deck!(deck)

  loop do # Player turn
    display_cards(player_cards)
    display_one_dealer_card(dealer_cards)
    prompt 'Hit or stay?'
    player_choice = gets.chomp.downcase
    player_cards += deal_1_card_from_deck!(deck) if player_choice.start_with?('h')
    break if busted?(player_cards) || player_choice.start_with?('s')
  end

  if busted?(player_cards)
    display_cards(player_cards)
    prompt 'You are busted! Dealer wins!'
  else
    prompt "Dealer's turn!"
  end

  unless busted?(player_cards)
    loop do # Dealer turn
      display_cards(dealer_cards)
      dealer_cards += deal_1_card_from_deck!(deck) if cards_total(dealer_cards) < 17
      break if busted?(dealer_cards) || cards_total(dealer_cards) >= 17
    end

    p cards_total(player_cards)
    p cards_total(dealer_cards)

    if busted?(dealer_cards)
      prompt "Dealer's busted! You win!"
    elsif cards_total(player_cards) > cards_total(dealer_cards)
      prompt 'You win!'
    elsif cards_total(player_cards) < cards_total(dealer_cards)
      prompt 'Dealer wins!'
    else
      prompt "It's a tie!"
    end
  end

  prompt 'Play again?'
  choice = gets.chomp.downcase
  break if choice.start_with?('n')
end

prompt 'Thank you for playing!'
