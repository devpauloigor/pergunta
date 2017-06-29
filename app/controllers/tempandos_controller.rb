class TempandosController < ApplicationController
  before_action :set_tempando, only: [:show, :edit, :update, :destroy]

  # GET /tempandos
  # GET /tempandos.json
  def index
    @tempandos = Tempando.all
  end

  # GET /tempandos/1
  # GET /tempandos/1.json
  def show
  end

  # GET /tempandos/new
  def new
    @tempando = Tempando.new
  end

  # GET /tempandos/1/edit
  def edit
  end

  # POST /tempandos
  # POST /tempandos.json
  def create
    @tempando = Tempando.new(tempando_params)

    respond_to do |format|
      if @tempando.save
        format.html { redirect_to @tempando, notice: 'Tempando was successfully created.' }
        format.json { render :show, status: :created, location: @tempando }
      else
        format.html { render :new }
        format.json { render json: @tempando.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tempandos/1
  # PATCH/PUT /tempandos/1.json
  def update
    respond_to do |format|
      if @tempando.update(tempando_params)
        format.html { redirect_to @tempando, notice: 'Tempando was successfully updated.' }
        format.json { render :show, status: :ok, location: @tempando }
      else
        format.html { render :edit }
        format.json { render json: @tempando.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tempandos/1
  # DELETE /tempandos/1.json
  def destroy
    @tempando.destroy
    respond_to do |format|
      format.html { redirect_to tempandos_url, notice: 'Tempando was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tempando
      @tempando = Tempando.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tempando_params
      params.require(:tempando).permit(:horario)
    end
end
