# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

toggleLoanForm = ->
  $('.btn-borrow').click -> 
    target = $(@).data().target
    $(target).toggle()
    initializeUserAutocomplete(target)

initializeUserAutocomplete = (target) ->
  $("#{target} .user-select").typeahead({
    name: 'users',
    prefetch: '/data/user_list.json',
    limit: 10,
  })

setUserId = (userInfo) ->
  $('#user-autocomplete-multiverse-id').val(userInfo.id)

handleAutocomplete = ->
  $("#user-autocomplete").on "typeahead:autocompleted", (e, i) -> setUserId(i)
  $("#user-autocomplete").on "typeahead:selected", (e, i) -> setUserId(i)

$(document).on "page:load", ->
  handleAutocomplete()
  toggleLoanForm()

$(document).ready ->
  handleAutocomplete()
  toggleLoanForm()
