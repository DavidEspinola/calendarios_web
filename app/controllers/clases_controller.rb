class ClasesController < ApplicationController
  before_action :set_clase, only: [:show, :edit, :update, :destroy]

  # GET /clases
  # GET /clases.json
  def index
    @clases = Clase.order(:nombre).page(params[:page]).per(30)
  end

  # GET /clases/1
  # GET /clases/1.json
  def show
  end

  # GET /clases/new
  def new
    @clase = Clase.new
  end

  # GET /clases/1/edit
  def edit
  end

  # POST /clases
  # POST /clases.json
  def create
    @clase = Clase.new(clase_params)

    respond_to do |format|
      if @clase.save
        format.html { redirect_to @clase, notice: 'La clase se ha creado con exito.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /clases/1
  # PATCH/PUT /clases/1.json
  def update
    respond_to do |format|
      if @clase.update(clase_params)
        format.html { redirect_to @clase, notice: 'La clase se ha editado con exito.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /clases/1
  # DELETE /clases/1.json
  def destroy
    @clase.destroy
    respond_to do |format|
      format.html { redirect_to clases_url, notice: 'La clase se ha eliminado con exito.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clase
      @clase = Clase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clase_params
      params.require(:clase).permit(:nombre, :descripcion, :recursos)
    end
end
