# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(document)
    
    .on 'click', '#invite-user-btn', (event) ->
      $(@).attr('disabled', true);
      $(@).closest('form').submit()



    .on 'ajax:complete', '#invite-user-form' , ->

      $(this).fadeOut("normal")


  # 絞り込みの動作
  $('#user-search-form')

    .on 'ajax:beforeSend', ->
      $('#vip-request-targets').empty()

    .on 'ajax:complete',  ( event, ajax, status) ->
      data = $.parseJSON( ajax.responseText )
      $('#vip-request-targets').append( data.html )

