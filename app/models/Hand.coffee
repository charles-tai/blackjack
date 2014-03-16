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


  dealerPlay: (friend,flag)=>
    # if flag then @set 'one', true
    if friend == undefined then friend = 1
    if not flag then @at(0).flip()
    console.log flag
    console.log friend
    console.log @scores()
    console.log @scores()[friend]
    while @scores()[friend] < 17
      @hit()
    if 16 < @scores()[friend] < 21
      @stand()
    if @scores()[friend] == 21 then @trigger('blackJack',@)
    if 21 < @scores()[friend]
      if not flag then return @dealerPlay(0,'on')
      else @trigger('bust', @)
    # @maxScore(@scores()[friend])


  maxScore: ()->
    if @scores()[1] == 21
      @trigger('blackJack',@)
      return @scores()[1]
    if @scores()[0] == @scores()[1] then return @scores()[1]
    # return the bigger of the 2 scores, unless the bigger score is over 21

    if @scores()[1] > @scores()[0]
      if not (@scores()[1] > 21)
        return @scores()[1]
      return @scores()[0]







