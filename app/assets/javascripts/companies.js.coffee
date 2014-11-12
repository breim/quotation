# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  autocomplete = new google.maps.places.Autocomplete($("#company_location")[0],
    country: "BR"
  )
  return