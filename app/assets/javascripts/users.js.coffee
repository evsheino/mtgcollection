# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initializeTradeCardAutocomplete = ->
  $('#new-traded-card').typeahead({
    name: 'cards',
    prefetch: '/data/printing_list.json',
    limit: 10,
  })

setCardId = (cardInfo) ->
  $('#traded_card_printing_id').val(cardInfo.id)

handleAutocomplete = ->
  $("#new-traded-card").on "typeahead:autocompleted", (e, i) -> setCardId(i)
  $("#new-traded-card").on "typeahead:selected", (e, i) -> setCardId(i)

$(document).on "page:change", ->
  initializeTradeCardAutocomplete()
  handleAutocomplete()

$ ->
  initializeTradeCardAutocomplete()
  handleAutocomplete()
