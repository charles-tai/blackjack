class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: -> @add(@deck.pop()).last()

  stand: -> @trigger('endTurn', @)

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
    # console.log @isDealer
    # if @isDealer
    if not @isDealer
      if score > 21 then @trigger('bust', @)
    if hasAce then [score, score + 10] else [score, score]

  dealerPlay: (index,flag)=>
    # if flag then @set 'one', true
    console.log(@)
    debugger
    index = index or 1
    if not flag then @at(0).flip()
    while @scores()[index] < 17
      @hit()
    if 16 < @scores()[index] < 21 then @stand()
    if @scores()[index] == 21 then @trigger('blackJack',@)
    if 21 < @scores()[index]
      if not flag then @dealerPlay(0,'on')
      else @trigger('bust', @)




