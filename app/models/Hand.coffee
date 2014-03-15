class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: -> @add(@deck.pop()).last()

  stand: -> @trigger('end', @)

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if score > 21 then @trigger('bust', @)
    # console.log @isDealer
    # if @isDealer

    if hasAce then [score, score + 10] else [score]

  dealerPlay: ->
    @at(0).flip()
    console.log 'before while loop ', @scores()[0]
    while @scores()[0] < 17
      console.log 'inside the while loop', @scores()[0]
      @hit()
    if 16 < @scores()[0] < 21 then console.log 'between 16 and 21 ', @scores()[0]
    #then @trigger('dealerStand', @)
    # console.log 'between 16 and 21 ', @scores()
    if 21 < @scores()[0] then console.log 'over21 ', @scores()
