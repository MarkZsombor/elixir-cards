defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Jack", "Queen", "King"]
    suits = ["Hearts", "Diamonds", "Spades", "Clubs"]

    # List comprehension, its a map function
    # Nesting comprehensions leads to an list of lists, needs to be flattened
    # cards = for suit <- suits do
    #   for value <- values do
    #     "#{value} of #{suit}"
    #   end
    # end
    # List.flatten(cards)

    # This will create a single list, already flattened
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(hand, card) do
    Enum.member?(hand, card)
  end

end
