# Bring linkable non-anchor elements to life with Turbolinks
$(document).on 'click', '[href]:not(a)', (e) ->
  Turbolinks.visit $(this).attr('href')

$(document).on 'page:fetch', ->
  $('#content').fadeOut 'slow', ->
    $('#page-spinner').fadeIn 'slow'

$(document).on 'page:change', ->
  $('#content').fadeIn 'slow'

$(document).on 'ajaxStart', ->
  $('#spinner').fadeIn 'fast'

$(document).on 'ajaxComplete', ->
  $('#spinner').fadeOut 'fast'

menu_hidden = true

show_menu = () ->
  $('#menu').fadeIn 'fast'
  menu_hidden = false

hide_menu = () ->
  $('#menu').fadeOut 'fast'
  menu_hidden = true

$(document).on 'click', '#menu-button', ->
  if menu_hidden then show_menu() else hide_menu()