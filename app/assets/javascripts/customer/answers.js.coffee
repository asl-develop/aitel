$ ->
  $(document)
    .on 'click', '#answers-list #reserve-sw', (e) ->
      target = $(@).attr('name')
      $("#answers-list ##{target}").toggle(200)


