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

  def edicion_multiple
    @patrones = []
    @fallidos = []
    params[:patrones].each do |patron_hash|
      if @patron_clase.update(patron_clase_params)
        @patrones << patron
      else
        @fallidos << patron
      end
    end
    respond_to do |format|
        format.html { redirect_to asignaturas_path, notice: 'Cambios cargados correctamente' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patron_clase
      @patron_clase = PatronClase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patron_clase_params
      params.require(:asignatura,:clase).permit(:orden, :duracion)
    end
end
