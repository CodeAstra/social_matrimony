# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $('a').bind 'click', (event) ->
      $anchor = $(this)
      $('html, body').stop().animate { scrollTop: $($anchor.attr('href')).offset().top }, 500, 'easeInCubic'
      event.preventDefault()
      return
    return
  return



# $ ->
#   window.firstLoad = true
#   $('#basic').click (ev) ->
#     ev.preventDefault()
#     if $(this).hasClass('#basic')
#       if $(this).hasClass('inactive')
#         $('#education','#family','#personal').removeClass 'inactive'
#         $('#education','#family','#personal').removeClass 'fadeOut'
#       else if $(this).hasClass('#family')
#         $('#basic','#family','#personal').removeClass 'inactive'
#         $('#basic','#family','#personal').removeClass 'fadeOut'
#       else if $(this).hasClass('#personal')
#         $('#basic','#family','#education').removeClass 'inactive'
#         $('#basic','#family','#education').removeClass 'fadeOut'
        
#     return
#   return

