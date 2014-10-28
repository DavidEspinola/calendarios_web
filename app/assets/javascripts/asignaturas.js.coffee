# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $(".edit_asignatura .list-group").sortable()
  actualizarAsignatura()

$(document).ready(ready)
$(document).on('page:load', ready)

actualizarAsignatura = ->
  asignatura = $(".edit_asignatura").attr("id").match(/[0-9]+/g)[0]
  patrones = []
  $(".patron_clase").each ->
    patron =
      id: $(this).attr("id").match(/[0-9]+/g)[0]
      asignatura_id: asignatura
      clase_id: $(this).attr("data-clase")
      duracion: $(this).attr("data-duracion")
      orden: $(this).index()+1

    # Comparar el orden y la duración originales para saber si se ha eliminado
    # tener en cuenta también la posibilidad de campos eliminados o nuevos
    patrones.push patron
    return


  #make the request
  jQuery.ajax
    async: true
    type: "POST"
    url: ("/patron_clases/edicion_multiple/")
    data:
      patrones: patrones
    dataType: "script"
    #success:

    error:
      console.log(patrones)
