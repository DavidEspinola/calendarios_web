# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $(".edit_asignatura .list-group").sortable()
  asignatura = $(".edit_asignatura").attr("id").match(/[0-9]+/g)[0]

  $("#edit_asignatura_"+asignatura).submit (event) ->
    event.preventDefault()
    actualizarAsignatura(asignatura)

$(document).ready(ready)
$(document).on('page:load', ready)

actualizarAsignatura = (asignatura) ->
  #asignatura = $(".edit_asignatura").attr("id").match(/[0-9]+/g)[0]
  editar = []
  nuevos = []
  # Recordar poner la clase eliminado cuando se haga click en la papelera en lugar de borrarlo directamente
  $(".patron_clase:not(.eliminado)").each ->
    identificador = $(this).attr("id")
    if(identificador == "new_patron_clase")
      patron =
        asignatura_id: asignatura
        clase_id: $(this).attr("data-clase")
        duracion: parseInt($(this).attr("data-duracion"))
        orden: $(this).index()+1
      nuevos.push patron
    else
      # Orden y duración después de las posibles modificaciones
      orden = $(this).index()+1
      duracion = parseInt($(this).find("input").val())
      patron = 
        id: identificador.match(/[0-9]+/g)[0]
        asignatura_id: asignatura
        clase_id: $(this).attr("data-clase")
        duracion: duracion
        orden: orden
      # Comprobamos si los patrones han cambiado
      if(parseInt($(this).attr("data-duracion")) != duracion or parseInt($(this).attr("data-orden")) != orden)
        editar.push patron

  # make the request
  jQuery.ajax
    async: true
    type: "POST"
    url: ("/patron_clases/edicion_multiple.json")
    data:
      editar: editar
    dataType: "script"
    success: (json) ->
      console.log("OK")
      console.log(json)

    error: (json) ->
      console.log("Error")
      console.log(json)
      #console.log(json.responseText)
