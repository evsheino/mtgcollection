# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initializeCardAutocomplete = ->
  $('#card-autocomplete').typeahead({
    name: 'cards',
    prefetch: '/data/card_list.json',
    limit: 10,
  })

setCardId = (cardInfo) ->
  $('#card-autocomplete-multiverse-id').val(cardInfo.id)

handleAutocomplete = ->
  $("#card-autocomplete").on "typeahead:autocompleted", (e, i) -> setCardId(i)
  $("#card-autocomplete").on "typeahead:selected", (e, i) -> setCardId(i)

$(document).on "page:change", ->
  initializeCardAutocomplete()
  handleAutocomplete()

$ ->
  initializeCardAutocomplete()
  handleAutocomplete()
