#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('stand', (-> @get('dealerHand').dealerPhase()), @)
    @get('dealerHand').on('compare',(-> @compare()),@)
    return

  compare: -> 
    playerScores = @get('playerHand').scores()
    dealerScores = @get('dealerHand').scores()
    