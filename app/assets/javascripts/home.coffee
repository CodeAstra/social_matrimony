# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('.carousel').carousel()

$ ->
  $('.slider-range-min').slider
    range: 'min'
    value: 3
    min: 1
    max: 5
    slide: (event, ui) ->
      amountSelector = @.dataset.amountSelector
      $(amountSelector).val (ui.value)
      return
  for ele in $('.slider-range-min')
    $(ele.dataset.amountSelector).val($(ele).slider('value'))
  return
