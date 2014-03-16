class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    @add _(_.range(0, 52)).shuffle().map (card) ->
    # @add _([1, 14, 27, 40, 0, 13, 5, 18]).shuffle().map (card) ->
    # @add _([1,0,3,4,5,6,7,6]).reverse().map (card) ->

      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> hand = new Hand [ @pop(), @pop() ], @

  dealDealer: -> new Hand [ @pop().flip(), @pop() ], @, true
