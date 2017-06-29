class ProvaalunosController < ApplicationController
  before_action :set_provaaluno, only: [:show, :edit, :update, :destroy]

  # GET /provaalunos
  # GET /provaalunos.json
  def index
    @provaalunos = Provaaluno.all
  end

  # GET /provaalunos/1
  # GET /provaalunos/1.json
  def show
  end

  # GET /provaalunos/new
  def new
    @provaaluno = Provaaluno.new
  end

  # GET /provaalunos/1/edit
  def edit
  end

  # POST /provaalunos
  # POST /provaalunos.json
  def create
    @provaaluno = Provaaluno.new(provaaluno_params)

    respond_to do |format|
      if @provaaluno.save
        format.html { redirect_to @provaaluno, notice: 'Provaaluno was successfully created.' }
        format.json { render :show, status: :created, location: @provaaluno }
      else
        format.html { render :new }
        format.json { render json: @provaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provaalunos/1
  # PATCH/PUT /provaalunos/1.json
  def update
    respond_to do |format|
      if @provaaluno.update(provaaluno_params)
        format.html { redirect_to @provaaluno, notice: 'Provaaluno was successfully updated.' }
        format.json { render :show, status: :ok, location: @provaaluno }
      else
        format.html { render :edit }
        format.json { render json: @provaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provaalunos/1
  # DELETE /provaalunos/1.json
  def destroy
    @provaaluno.destroy
    respond_to do |format|
      format.html { redirect_to provaalunos_url, notice: 'Provaaluno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provaaluno
      @provaaluno = Provaaluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provaaluno_params
      params.require(:provaaluno).permit(:prova_id, :aluno_id, :status)
    end
end
