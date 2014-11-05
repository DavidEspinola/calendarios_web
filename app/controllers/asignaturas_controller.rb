class AsignaturasController < ApplicationController
  before_action :set_asignatura, only: [:update, :destroy]
  before_action :set_asignatura_patron, only: [:show, :edit]

  # GET /asignaturas
  # GET /asignaturas.json
  def index
    @asignaturas = Asignatura.search(params[:busqueda]).order(:nombre).page(params[:page]).per(20)
  end

  # GET /asignaturas/1
  # GET /asignaturas/1.json
  def show
  end

  # GET /asignaturas/new
  def new
    @asignatura = Asignatura.new
  end

  # GET /asignaturas/1/edit
  def edit
    @clases = Clase.search(params[:busqueda]).order(:nombre).page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /asignaturas
  # POST /asignaturas.json
  def create
    @asignatura = Asignatura.new(asignatura_params)

    respond_to do |format|
      if @asignatura.save
        format.html { redirect_to @asignatura, notice: 'La asignatura se ha creado con exito.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /asignaturas/1
  # PATCH/PUT /asignaturas/1.json
  def update
    respond_to do |format|
      if @asignatura.update(asignatura_params)
        format.html { redirect_to @asignatura, notice: 'La asignatura se ha editado con exito.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /asignaturas/1
  # DELETE /asignaturas/1.json
  def destroy
    @asignatura.destroy
    respond_to do |format|
      format.html { redirect_to asignaturas_url, notice: 'La asignatura se ha eliminado con exito.' }
    end
  end

  def nuevo_patron
    @clase=params[:id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignatura
      @asignatura = Asignatura.find(params[:id])
    end
    def set_asignatura_patron
      @asignatura = Asignatura.includes(:patron_clases,:clases).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asignatura_params
      params.require(:asignatura).permit(:nombre, :descripcion, :tags)
    end
end
