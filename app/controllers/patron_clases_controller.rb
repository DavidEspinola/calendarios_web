class PatronClasesController < ApplicationController
  before_action :set_patron_clase, only: [:show, :edit, :update, :destroy]

  # GET /patron_clases
  # GET /patron_clases.json
  def index
    @patron_clases = PatronClase.all
  end

  # GET /patron_clases/1
  # GET /patron_clases/1.json
  def show
  end

  # GET /patron_clases/new
  def new
    @patron_clase = PatronClase.new
  end

  # GET /patron_clases/1/edit
  def edit
  end

  # POST /patron_clases
  # POST /patron_clases.json
  def create
    @patron_clase = PatronClase.new(patron_clase_params)

    respond_to do |format|
      if @patron_clase.save
        format.html { redirect_to @patron_clase, notice: 'El patron_clase se ha creado con exito.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /patron_clases/1
  # PATCH/PUT /patron_clases/1.json
  def update
    respond_to do |format|
      if @patron_clase.update(patron_clase_params)
        format.html { redirect_to @patron_clase, notice: 'El patron_clase se ha editado con exito.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /patron_clases/1
  # DELETE /patron_clases/1.json
  def destroy
    @patron_clase.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

  #POST /patron_clases/edicion_multiple.json
  def edicion_multiple
    @resultado = { ediciones:{total:0, error:0}, creaciones:{total:0, error:0}, borrados:{total:0,error:0}}

    editar = params[:editar]

    if editar != nil
      if editar.is_a?(Hash)
        @patrones_hash = editar.values
      else
        @patrones_hash = editar
      end
      @resultado[:ediciones][:total] = @patrones_hash.size
      @patrones_hash.each do |patron_hash|
        @patron_clase = PatronClase.find(patron_hash[:id])
        unless @patron_clase.update(patron_hash)
          @resultado[:ediciones][:error] += 1
        end
      end
    end

    eliminar = params[:eliminar]

    if eliminar != nil
      if eliminar.is_a?(Hash)
        @patrones_hash = eliminar.values
      else
        @patrones_hash = eliminar
      end
      @resultado[:borrados][:total] = @patrones_hash.size
      @patrones_hash.each do |patron_hash|
        @patron_clase = PatronClase.find(patron_hash[:id])
        unless @patron_clase.destroy
          @resultado[:borrados][:error] += 1
        end
      end
    end

    nuevos = params[:nuevos]

    if nuevos != nil
      if nuevos.is_a?(Hash)
        @patrones_hash = nuevos.values
      else
        @patrones_hash = nuevos
      end
      @resultado[:creaciones][:total] = @patrones_hash.size
      @patrones_hash.each do |patron_hash|
        unless PatronClase.create(patron_hash)
          @resultado[:creaciones][:error] += 1
        end
      end
    end

    nombre = params[:nombre]
    descripcion = params[:descripcion]
    tags = params[:tags]

    @asignatura = Asignatura.find(params[:id])
    @asignatura.update(nombre: nombre, descripcion: descripcion, tags: tags)

    respond_to do |format|
      format.json { render json: @resultado }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patron_clase
      @patron_clase = PatronClase.find(params[:id])
    end
end
