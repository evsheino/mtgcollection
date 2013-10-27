# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initializeTradeCardAutocomplete = ->
  $('#new-traded-card').typeahead({
    name: 'cards',
    prefetch: '/data/trade_card_list.json',
    limit: 10,
  })

setCardId = (e, cardInfo) ->
  $('#card-id').val(cardInfo.id)

handleAutocomplete = ->
  $("#new-traded-card").on "typeahead:autocompleted", (e, i) -> setCardId(e, i)
  $("#new-traded-card").on "typeahead:selected", (e, i) -> setCardId(e, i)

$(document).on "page:change", ->
  initializeTradeCardAutocomplete()
  handleAutocomplete()

$ ->
  initializeTradeCardAutocomplete()
  handleAutocomplete()

