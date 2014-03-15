// Generated by CoffeeScript 1.7.1
(function() {
  describe('deck', function() {
    var deck, hand;
    deck = null;
    hand = null;
    beforeEach(function() {
      deck = new Deck();
      return hand = deck.dealPlayer();
    });
    return describe('hit', function() {
      return it("should give the last card from the deck", function() {
        expect(deck.length).toBe(50);
        expect(deck.last()).toEqual(hand.hit());
        expect(deck.length).toBe(49);
        expect(deck.last()).toEqual(hand.hit());
        return expect(deck.length).toBe(48);
      });
    });
  });

}).call(this);

//# sourceMappingURL=DeckSpec.map
