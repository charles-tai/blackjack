#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    deck = @get 'deck'
    playerHand = @get 'playerHand'
    dealerHand = @get 'dealerHand'

    # Event listeners
    playerHand.on 'endTurn', =>
      console.log 'player turn end'
      dealerHand.dealerPlay()
    playerHand.on 'bust', =>
      console.log 'player lost'

    dealerHand.on 'bust', () =>
      console.log 'dealer bust'
    dealerHand.on 'endTurn', () =>
      console.log 'dealer turn ended'
      @checkScore()

  checkScore: ->
    playerHand = @get 'playerHand'
    dealerHand = @get 'dealerHand'
    playerScore = playerHand.scores()[0]
    dealerScore = dealerHand.scores()[0]

    if playerScore == dealerScore then console.log 'draw'
    else if playerScore > dealerScore then console.log 'player wins'
    else console.log 'dealer wins'
