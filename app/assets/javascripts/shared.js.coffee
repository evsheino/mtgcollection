initializeFormToggle = ->
  $('.btn-toggle-form').click -> 
    target = $(@).data().target
    $(target).toggle()
    initializeUserAutocomplete(target)

initializeUserAutocomplete = (target) ->
  $("#{target} .user-select").typeahead({
    name: 'users',
    prefetch: '/data/user_list.json',
    limit: 10,
  })
  $("#{target} .user-select").change -> 
    $($("#{target} .user-select")[0].dataset.target).val('')

setUserId = (event, userInfo) ->
  $($(event.target).data().target).val(userInfo.id)

handleAutocomplete = ->
  $(".user-select").on "typeahead:autocompleted", (e, i) -> setUserId(e, i)
  $(".user-select").on "typeahead:selected", (e, i) -> setUserId(e, i)

$(document).on "page:load", ->
  handleAutocomplete()
  initializeFormToggle()

$(document).ready ->
  handleAutocomplete()
  initializeFormToggle()
