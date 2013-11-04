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

setCardNumber = (number) ->
  $('#traded_card_number').val(number)

addCardSubmitButtonEvent = ->
  $('#add-my-card').on 'click', (e, i) -> setCardNumber(-1)
  $('#add-their-card').on 'click', (e, i) -> setCardNumber(1)

$(document).on "page:change", ->
  initializeTradeCardAutocomplete()
  handleAutocomplete()
  addCardSubmitButtonEvent()

$ ->
  initializeTradeCardAutocomplete()
  handleAutocomplete()
  addCardSubmitButtonEvent()