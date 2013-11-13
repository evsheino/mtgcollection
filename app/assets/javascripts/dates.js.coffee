initializeDatePicker = ->
  $('[data-behaviour~=datepicker]').datepicker({
    "format": "yyyy-mm-dd",
    "weekStart": 1,
    "autoclose": true
  })

$(document).on "page:change", ->
  initializeDatePicker()

$ -> initializeDatePicker()
