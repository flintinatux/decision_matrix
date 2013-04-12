# Bring linkable non-anchor elements to life with Turbolinks
$(document).on 'click', '[href]:not(a)', (e) ->
  Turbolinks.visit $(this).attr('href')

$(document).on 'page:fetch', ->
  $('#content').fadeOut 'slow'

$(document).on 'page:change', ->
  $('#content').fadeIn 'slow'