defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 32 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 32
  end
  
  test "shuffle changes the order of a deck" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end

# Assert needs to be true to pass, refute needs false to pass
