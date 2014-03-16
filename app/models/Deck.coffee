class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    @add _(_.range(0, 52)).shuffle().map (card) ->
    # @add _([1, 14, 27, 40, 0, 13, 5, 18]).shuffle().map (card) ->
    # @add _([0, 5, 18, 1, 13, 6, 7, 8]).reverse().map (card) ->

      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> hand = new Hand [ @pop(), @pop() ], @

  dealDealer: -> new Hand [ @pop().flip(), @pop() ], @, true
