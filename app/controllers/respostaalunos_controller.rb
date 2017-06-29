class RespostaalunosController < ApplicationController
  before_action :set_respostaaluno, only: [:show, :edit, :update, :destroy]

  # GET /respostaalunos
  # GET /respostaalunos.json
  def index
    @respostaalunos = Respostaaluno.all
  end

  # GET /respostaalunos/1
  # GET /respostaalunos/1.json
  def show
  end

  # GET /respostaalunos/new
  def new
    @respostaaluno = Respostaaluno.new
  end

  # GET /respostaalunos/1/edit
  def edit
  end

  # POST /respostaalunos
  # POST /respostaalunos.json
  def create
    @respostaaluno = Respostaaluno.new(respostaaluno_params)

    respond_to do |format|
      if @respostaaluno.save
        format.html { redirect_to @respostaaluno, notice: 'Respostaaluno was successfully created.' }
        format.json { render :show, status: :created, location: @respostaaluno }
      else
        format.html { render :new }
        format.json { render json: @respostaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /respostaalunos/1
  # PATCH/PUT /respostaalunos/1.json
  def update
    respond_to do |format|
      if @respostaaluno.update(respostaaluno_params)
        format.html { redirect_to @respostaaluno, notice: 'Respostaaluno was successfully updated.' }
        format.json { render :show, status: :ok, location: @respostaaluno }
      else
        format.html { render :edit }
        format.json { render json: @respostaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respostaalunos/1
  # DELETE /respostaalunos/1.json
  def destroy
    @respostaaluno.destroy
    respond_to do |format|
      format.html { redirect_to respostaalunos_url, notice: 'Respostaaluno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respostaaluno
      @respostaaluno = Respostaaluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def respostaaluno_params
      params.require(:respostaaluno).permit(:provaaluno_id, :resposta_id)
    end
end
