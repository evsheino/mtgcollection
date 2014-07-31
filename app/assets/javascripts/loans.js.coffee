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

setUserId = (event, userInfo) ->
  $($(event.target).data().target).val(userInfo.id)

handleAutocomplete = ->
  $(".user-select").on "typeahead:autocompleted", (e, i) -> setUserId(e, i)
  $(".user-select").on "typeahead:selected", (e, i) -> setUserId(e, i)

$(document).on "page:load", ->
  handleAutocomplete()
  toggleLoanForm()

$(document).ready ->
  handleAutocomplete()
  toggleLoanForm()
