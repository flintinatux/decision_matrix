# Bring linkable non-anchor elements to life with Turbolinks
$(document).on 'click', '[href]:not(a)', (e) ->
  Turbolinks.visit $(this).attr('href')