# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.typeahead').typeahead({
    name: 'cards',
    prefetch: '/data/trade_card_list.json',
    limit: 10,
  });