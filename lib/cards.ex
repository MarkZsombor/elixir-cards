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

  def deal(deck, hand_size) do
    # Need to split the list
    # Creates a tuple
    Enum.split(deck, hand_size)
  end

  def contains?(hand, card) do
    Enum.member?(hand, card)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # Works, could be better using pattern matching
    # { status, binary } = File.read(filename)
    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "File not found"
    # end  

    # Do comparision and assignment at the same time
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _ } -> "File not found"
    end
    
  end

end
