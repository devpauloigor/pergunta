class QuestaoProvasController < ApplicationController
  before_action :set_questao_prova, only: [:show, :edit, :update, :destroy]

  # GET /questao_provas
  # GET /questao_provas.json
  def index
    @questao_provas = QuestaoProva.all
  end

  # GET /questao_provas/1
  # GET /questao_provas/1.json
  def show
  end

  # GET /questao_provas/new
  def new
    @questao_prova = QuestaoProva.new
  end

  # GET /questao_provas/1/edit
  def edit
  end

  # POST /questao_provas
  # POST /questao_provas.json
  def create
    @questao_prova = QuestaoProva.new(questao_prova_params)

    respond_to do |format|
      if @questao_prova.save
        format.html { redirect_to @questao_prova, notice: 'Questao prova was successfully created.' }
        format.json { render :show, status: :created, location: @questao_prova }
      else
        format.html { render :new }
        format.json { render json: @questao_prova.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questao_provas/1
  # PATCH/PUT /questao_provas/1.json
  def update
    respond_to do |format|
      if @questao_prova.update(questao_prova_params)
        format.html { redirect_to @questao_prova, notice: 'Questao prova was successfully updated.' }
        format.json { render :show, status: :ok, location: @questao_prova }
      else
        format.html { render :edit }
        format.json { render json: @questao_prova.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questao_provas/1
  # DELETE /questao_provas/1.json
  def destroy
    @questao_prova.destroy
    respond_to do |format|
      format.html { redirect_to questao_provas_url, notice: 'Questao prova was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questao_prova
      @questao_prova = QuestaoProva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questao_prova_params
      params.require(:questao_prova).permit(:prova_id, :questao_id)
    end
end
