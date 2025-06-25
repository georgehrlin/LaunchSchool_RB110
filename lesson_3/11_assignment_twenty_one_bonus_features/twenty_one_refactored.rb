require 'yaml'
require 'pry-byebug'

GAME_TEXT = YAML.load_file('twenty_one_messages.yml')
ROUNDS_TO_WIN = 3
BUST_LIMIT = 21
DEALER_MINIMUM = 17

SUITS = ['c', 'd', 'h', 's']
CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'a', 'j', 'k', 'q']

def clear_screen
  system('clear')
end

def prompt(msg)
  puts "=> #{msg}"
end

def prompt_game_text(key)
  prompt(GAME_TEXT[key])
end

def prompt_format_text(key, *arguments)
  prompt(format(GAME_TEXT[key], *arguments))
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
  prompt cards.to_s # "#{cards}"
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
  prompt "Card dealt: #{translate_a_card_for_display(card_dealt)}"
  [card_dealt]
end

def convert_cards_to_face_vals(cards)
  cards.map { |card| card[1..-1] }
end

def translate_card_suit(suit_acronym)
  case suit_acronym
  when 'c'
    'Clubs'
  when 'd'
    'Diamonds'
  when 'h'
    'Hearts'
  when 's'
    'Spades'
  end
end

def translate_card_special_val(special_value)
  case special_value
  when 'a'
    'Ace'
  when 'j'
    'Jack'
  when 'k'
    'King'
  when 'q'
    'Queen'
  else
    special_value
  end
end

def translate_a_card_for_display(card)
  suit = translate_card_suit(card[0])
  val = translate_card_special_val(card[1..-1])
  "#{val} of #{suit}"
end

def translate_cards_for_display(cards)
  cards.map do |card|
    translate_a_card_for_display(card)
  end
end

def format_cards_for_display(cards)
  translate_cards_for_display(cards).to_s.[](1..-2)
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

  numeric_vals[numeric_vals.index(11)] = 1 if numeric_vals.sum > BUST_LIMIT &&
                                              numeric_vals.include?(11)

  numeric_vals.sum
end

def hit_or_stay
  loop do
    player_choice = gets.chomp.downcase
    prompt_game_text('invalid_choice') if !(player_choice.start_with?('h') ||
                                            player_choice.start_with?('s'))
    if player_choice.start_with?('h')
      return 'hit'
    elsif player_choice.start_with?('s')
      return 'stay'
    end
  end
end

def player_turn(deck, player_cards, dealer_cards, player_cards_total)
  prompt_format_text('display_player_cards',
                     format_cards_for_display(player_cards))
  prompt_format_text('display_player_total', player_cards_total)
  prompt_format_text('display_dealer_one_card',
                     (translate_cards_for_display(dealer_cards))[0])
  prompt_game_text('hit_or_stay')
  player_choice = hit_or_stay
  clear_screen

  if player_choice.start_with?('h')
    player_cards += deal_1_card_from_deck!(deck)
    sleep(1.5)
  end

  [player_choice, player_cards]
end

def busted?(cards_total)
  cards_total > BUST_LIMIT
end

def player_turn_concludes(player_cards, player_cards_total)
  if busted?(player_cards_total)
    prompt_format_text('display_player_cards',
                       translate_cards_for_display(player_cards))
    prompt_format_text('display_player_total', player_cards_total)
    sleep(1)
    prompt 'You busted! Dealer won this round.'
  else
    prompt "Dealer's turn!"
    sleep(1.5)
  end
end

def dealer_turn_begins(dealer_cards, dealer_cards_total)
  prompt_format_text('display_dealer_cards',
                     translate_cards_for_display(dealer_cards))
  prompt_format_text('display_dealer_total', dealer_cards_total)
  sleep(1.5)
end

def dealer_turn_continues(deck, dealer_cards, dealer_cards_total)
  dealer_choice = nil
  if dealer_cards_total < DEALER_MINIMUM
    prompt_game_text('dealer_hits')
    dealer_choice = 'hit'
    dealer_cards += deal_1_card_from_deck!(deck)
    sleep(1.5)
  else
    prompt_game_text('dealer_stays')
    sleep(1.5)
    dealer_choice = 'stay'
  end

  [dealer_choice, dealer_cards]
end

def update_scores(player_cards_total,
                  dealer_cards_total,
                  player_score,
                  dealer_score)
  if busted?(dealer_cards_total)
    [player_score + 1, dealer_score]
  elsif busted?(player_cards_total)
    [player_score, dealer_score + 1]
  elsif player_cards_total > dealer_cards_total
    [player_score + 1, dealer_score]
  elsif player_cards_total < dealer_cards_total
    [player_score, dealer_score + 1]
  else
    [player_score, dealer_score]
  end
end

def announce_round_result(player_cards_total, dealer_cards_total)
  puts '-' * 30
  prompt_format_text('display_player_total', player_cards_total)
  prompt_format_text('display_dealer_total', dealer_cards_total)
  puts '-' * 30
  sleep(1.5)

  if busted?(dealer_cards_total)
    prompt "Dealer busted! You won this round!"
  elsif player_cards_total > dealer_cards_total
    prompt 'You won this round!'
  elsif player_cards_total < dealer_cards_total
    prompt 'Dealer won this round!'
  else
    prompt "It's a tie!"
  end
  sleep(1.5)
end

def display_scores(player_score, dealer_score)
  puts '-' * 30
  prompt "Your score: #{player_score} | Dealer score: #{dealer_score}"
end

def announce_grand_winner(player_score)
  if player_score == ROUNDS_TO_WIN
    prompt "YOU ARE THE GRAND WINNER!"
    sleep(1.5)
    puts "୧(๑•̀ヮ•́)૭ LET'S GO!!!"
  else
    prompt "Dealer is the grand winner."
  end
end

def play_again?
  prompt 'Play again? (y or n)'
  choice = gets.chomp.downcase
  clear_screen
  choice.start_with?('y')
end

prompt_game_text('welcome')
sleep(1.5)
prompt_format_text('rounds_to_win', ROUNDS_TO_WIN)
sleep(1.5)

loop do # main loop
  player_score = 0
  dealer_score = 0

  until player_score == ROUNDS_TO_WIN || dealer_score == ROUNDS_TO_WIN
    deck = initialize_deck
    player_cards = []
    dealer_cards = []

    player_cards += deal_2_cards_from_deck!(deck)
    dealer_cards += deal_2_cards_from_deck!(deck)

    player_cards_total = cards_total(player_cards)
    dealer_cards_total = cards_total(dealer_cards)

    loop do # player turn
      player_choice, player_cards = player_turn(deck,
                                                player_cards,
                                                dealer_cards,
                                                player_cards_total)
      player_cards_total = cards_total(player_cards)
      break if busted?(player_cards_total) || player_choice.start_with?('s')
    end

    player_turn_concludes(player_cards, player_cards_total)

    unless busted?(player_cards_total)
      loop do # dealer turn
        dealer_turn_begins(dealer_cards, dealer_cards_total)

        break if busted?(dealer_cards_total)

        dealer_choice, dealer_cards = dealer_turn_continues(deck,
                                                            dealer_cards,
                                                            dealer_cards_total)

        dealer_cards_total = cards_total(dealer_cards)

        break if dealer_choice.start_with?('s')
      end

      announce_round_result(player_cards_total, dealer_cards_total)
    end

    player_score, dealer_score = update_scores(player_cards_total,
                                               dealer_cards_total,
                                               player_score,
                                               dealer_score)

    display_scores(player_score, dealer_score)
    sleep(2.5)

    prompt 'Press Enter to continue.'
    gets
    clear_screen
  end

  announce_grand_winner(player_score)

  play_again? ? next : break
end

prompt 'Thank you for playing!'
