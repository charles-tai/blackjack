#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    deck = @get 'deck'
    playerHand = @get 'playerHand'
    dealerHand = @get 'dealerHand'
    playerHand.on 'end', =>
      console.log 'player turn end'
      #console.log('end event triggered on App');
      # then dealer decides what to do based on his score and rules

      # if dealer has not flipped then flip
      dealerHand.at(0).flip()
      # checkScore
      #


    playerHand.on 'bust', =>
      console.log('playerLose')
    dealerHand.on 'end', (playerOrDealer) =>
      console.log 'player?', playerOrDealer
