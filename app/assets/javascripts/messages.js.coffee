# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  # 絞り込みの動作
  $('#search-form')

    .on 'ajax:beforeSend', ->
      $('#search-form input').attr('disabled', true);
      $('#to_users').empty()

    .on 'ajax:complete',  ( event, ajax, status) ->
      $('#search-form input').removeAttr('disabled');
      data = $.parseJSON( ajax.responseText )

      $.each data , (key, val) ->
        to_user = $("<input type='checkbox' id='unit' name='to_users[]' />#{val.user.name}<br />"  )
        
        $('#to_users').append( to_user )
        #J.hide()
        #.slideDown()







