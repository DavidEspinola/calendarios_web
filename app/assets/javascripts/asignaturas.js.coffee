# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $(".edit_asignatura .list-group").sortable()
  asignatura = $(".edit_asignatura").attr("id").match(/[0-9]+/g)[0]

  $("#edit_asignatura_" + asignatura).submit (event) ->
    event.preventDefault()
    actualizarAsignatura(asignatura)

  $(".edit_asignatura .list-group").on("click",".eliminar", (event) ->
    event.preventDefault()
    marcarborrado($(this))
  )

  $("#contenido_modal").on("click", ".clase", (event) ->
    $(".clase").removeClass("info")
    $(this).addClass("info")
    nuevo = $(this).attr("id").match(/[0-9]+/g)[0]
    nuevo = $(".modal-footer .button_to").attr("action").replace(/\d+/g,nuevo)
    $(".modal-footer .button_to").attr("action",nuevo)
  )
  $("#contenido_modal").on("click", ".clase.info", (event) ->
    $(this).removeClass("info")
    nuevo = $(".modal-footer .button_to").attr("action").replace(/\d+/g,0)
    $(".modal-footer .button_to").attr("action",nuevo)
  )

$(document).ready(ready)
$(document).on('page:load', ready)

actualizarAsignatura = (asignatura) ->
  #asignatura = $(".edit_asignatura").attr("id").match(/[0-9]+/g)[0]
  editar = []
  nuevos = []
  eliminar = []

  patrones_activos = $(".patron_clase:not(.disabled)")
  patrones_borrados = $(".patron_clase.disabled")

  patrones_activos.each ->
    identificador = $(this).attr("id")
    # Orden y duración después de las posibles modificaciones
    orden = patrones_activos.index($(this))+1
    duracion = parseInt($(this).find("input").val())
    if(identificador == "new_patron_clase")
      patron =
        asignatura_id: asignatura
        clase_id: $(this).attr("data-clase")
        duracion: duracion
        orden: orden
      nuevos.push patron
    else
      patron = 
        id: identificador.match(/[0-9]+/g)[0]
        asignatura_id: asignatura
        clase_id: $(this).attr("data-clase")
        duracion: duracion
        orden: orden
      # Comprobamos si los patrones han cambiado para enviarlos a actualizar
      if(parseInt($(this).attr("data-duracion")) != duracion or parseInt($(this).attr("data-orden")) != orden)
        editar.push patron

  patrones_borrados.each ->
    identificador = $(this).attr("id")
    patron =
      id: identificador.match(/[0-9]+/g)[0]
    eliminar.push patron
    #TODO terminar borrados
  console.log(eliminar)

  # make the request
  jQuery.ajax
    async: true
    type: "POST"
    url: ("/patron_clases/edicion_multiple.json")
    data:
      editar: editar
      eliminar: eliminar
      nuevos: nuevos
      id: asignatura
      nombre: $("#asignatura_nombre").val()
      descripcion: $("#asignatura_descripcion").val()
      tags: $("#asignatura_tags").val()
    dataType: "json"
    success: (json) ->
      console.log("OK")
      console.log(json)
      window.location.replace window.location.href.replace("/edit","")

    error: (json) ->
      console.log("Error")
      console.log(json)

marcarborrado = (icono) ->
  patron = icono.closest(".patron_clase")
  if patron.attr("id") == "new_patron_clase"
    patron.remove()
  else
    patron.toggleClass("disabled")
    patron.find(".badge input").prop("disabled", patron.hasClass("disabled"))
    icono.toggleClass("glyphicon-ban-circle")