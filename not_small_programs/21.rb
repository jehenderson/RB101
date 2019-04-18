require "pry"
def initialize_deck
  deck = Hash.new
  suits = ["spades", "hearts", "clubs", "diamonds"]
  values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"]
  i = 1
  suits.each do |suit|
    values.each do |value|
      card = Hash.new
      card[:suit] = suit
      card[:face] = value
      card[:value] = value.to_i if value.to_i.to_s == value
      card[:value] = 11 if value == "jack" || value == "queen" || value == "king"
      card[:value] = [1, 11] if value == "ace"
      deck[i] = card
      i += 1
    end
  end
  deck
end

def deal(deck, hand, num_cards)
  num_cards.times do
    cardID = deck.keys.sample
    hand[cardID] = deck[cardID]
    deck.delete(cardID)
  end
end

def count_total(hand)
  value = 0
  hand.each {|cardID, card| card[:face] == "ace" ? value += card[:value][0] : value += card[:value]}
  hand.select {|cardID, card| card[:face] == "ace"}.count.times {value -= 10 if value > 21}
  value
end

def win?(hand1, hand2, user)
  user ? count_total(hand1) > count_total(hand2) : count_total(hand1) >= count_total(hand2)
end

def bust?(hand)
  count_total(hand) > 21 ? true : false
end

def display(hand)
  system "clear"
  puts "Cards:"
  hand.each {|cardID, card| puts "#{card[:face].capitalize} of #{card[:suit].capitalize}"}
end

def play(player, deck, hand1, hand2)
  user = player
  deal(deck, hand1, 2)
  stay = false
  loop do
    if user
      display(hand1)
      puts "Hit or stay?"
      stay = true if gets.chomp[0] == 's'.upcase
    elsif win?(hand1, hand2, user) && user==false
        stay = true
        puts "Dealer wins."
    end
    break if stay
    deal(deck, hand1, 1)
    display(hand1)
    if bust?(hand1)
      puts "Busted!"
      display(hand1)
      puts "You win!" unless user
      return
    end
  end
end

user_hand = Hash.new
dealer_hand = Hash.new
game_deck = initialize_deck
play(true, game_deck, user_hand, dealer_hand)
play(false, game_deck, dealer_hand, user_hand)
