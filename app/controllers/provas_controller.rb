class ProvasController < ApplicationController
  before_action :set_prova, only: [:show, :edit, :update, :destroy]
  respond_to :docx
  # GET /provas
  # GET /provas.json
  def index
    
    @provas = Prova.all

  end

  # GET /provas/1
  # GET /provas/1.json
  
  def show

    
  end

  # GET /provas/new
  def new
    @prova = Prova.new
  end

  # GET /provas/1/edit
  def edit
  end

  # POST /provas
  # POST /provas.json
  def create
    @prova = Prova.new(prova_params)

    respond_to do |format|
      if @prova.save
        format.html { redirect_to @prova, notice: 'Prova was successfully created.' }
        format.json { render :show, status: :created, location: @prova }
      else
        format.html { render :new }
        format.json { render json: @prova.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provas/1
  # PATCH/PUT /provas/1.json
  def update
    respond_to do |format|
      if @prova.update(prova_params)
        format.html { redirect_to @prova, notice: 'Prova was successfully updated.' }
        format.json { render :show, status: :ok, location: @prova }
      else
        format.html { render :edit }
        format.json { render json: @prova.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provas/1
  # DELETE /provas/1.json


  def provamodal

    @contadorr = params[:contador]


    respond_to do |format|
      format.js
    end

  end


  def bancoquestao



     @idu = current_user.id


 @nomeorigi = "quest_"+@idu.to_s+".json"
 if(FileTest.exist?("#{Rails.root}/app/assets/images/provas/#{@nomeorigi}"))
  path = File.join(Rails.root,"app/assets/images/provas",@nomeorigi)
  @arq = File.read(path)
  @js = JSON.parse(@arq)
  @jsons = []


@tamanhoquest=""
@js.each do |jss|

@questa = Questao.where('id=?', jss["id"])
@questa.each do |qat|

@tamanhoquest+=qat.descricao


end

end
end


   @contador = 0 
   @questao = Questao.new
   @subgrupo_id = SubGrupo.all
   @tema_id = Tema.all
   @pergunta_id = params[:questao_id]
   questao_id= params[:questao_id]
   @qualificacoes = Questao.where("pergunta_id = ?",@pergunta_id)


  





   questao_id= params[:questao_id]
   tema_id= params[:tema_id]

       #@respsubg=QuestaoSubgrupo.joins('inner join sub_grupos on sub_grupos.id =questao_subgrupos.sub_grupo_id').where("questao_id=?", questao_id).select('sub_grupos.nome, questao_subgrupos.id')

       @resptem=QuestaoSubgrupo.joins('inner join temas on temas.id =questao_subgrupos.tema_id').where("questao_id=?", questao_id).select('temas.descricao, questao_subgrupos.id')

       @respostas = Resposta.where("pergunta_id = 5263")

#-------------------- codigo do consulta ---------------------------


@nquali = params[:nquali]
@squali = params[:squali]


@pagen = 1
if (params.has_key?(:page))
  @pagen = params[:page]
end

if(@nquali == 'nao' && params.has_key?(:descricao))
  @descricao = params[:descricao]
  @ret  = Questao.joins("left outer join auditas on auditas.questao_id=questoes.id left outer join useres on useres.id = auditas.useres_id").where('questoes.id  not in (select questao_id from questao_subgrupos where questao_id = questoes.id) and descricao ilike ?','%'+@descricao+'%').select('questoes.id as id, questoes.descricao as descricao, useres.nome_completo as email').order('questoes.id desc').paginate(:page => params[:page], :per_page => 10)
  @descri = @descricao
elsif(@squali == 'sim' && params.has_key?(:descricao))
  @descricao = params[:descricao]
  @ret  = VwQuali.where('descricao ilike ?','%'+@descricao+'%').paginate(:page => params[:page], :per_page => 10)
  @descri = @descricao
elsif (@squali == 'sim')
  @ret  = VwQuali.all.paginate(:page => params[:page], :per_page => 10)
  @descri = nil   
elsif (@nquali == 'nao')
  @ret  = Questao.joins("left outer join auditas on auditas.questao_id=questoes.id left outer join useres on useres.id = auditas.useres_id").where('questoes.id  not in (select questao_id from questao_subgrupos where questao_id = questoes.id)').select('questoes.id as id, questoes.descricao as descricao, useres.nome_completo as email').order('questoes.id desc').paginate(:page => params[:page], :per_page => 10)
  @descri = nil      
else
  @descricao = params[:descricao]
   # @ret  = Questao.joins("left outer join auditas on auditas.questao_id=questoes.id left outer join useres on useres.id = auditas.useres_id").where('descricao ilike ?','%'+@descricao+'%').select('questoes.id as id, questoes.descricao as descricao, useres.nome_completo as email').order('questoes.id desc').paginate(:page => params[:page], :per_page => 10)
   #@ret  = Questao.joins("left outer join auditas on auditas.questao_id=questoes.id left outer join useres on useres.id = auditas.useres_id").where('questoes.id = ?',@descricao).select('questoes.id as id, questoes.descricao as descricao, useres.nome_completo as email').order('questoes.id desc').paginate(:page => params[:page], :per_page => 10)
   @ret = ActiveRecord::Base.connection.select_all("select * from consulta_questao('#{@descricao}')").to_a.paginate(:page => params[:page], :per_page => 10)

   Rails.logger.debug(@ret)
   @descri = @descricao

 end


 @page = @ret


 
 


end #Fim do banco de questoes




def cadprova
 @timer = 0
 @idu = params[:idu]
 @nome= params[:nomeprova]
 @online = params[:online]
 @turma = params[:turma]
 @data = params[:data]
 @duracao = params[:duracao]
 @mostraresultado = params[:mostraresultado]


 @nomeorigi = "quest_"+@idu.to_s+".json"
 if(FileTest.exist?("#{Rails.root}/app/assets/images/provas/#{@nomeorigi}"))
  path = File.join(Rails.root,"app/assets/images/provas",@nomeorigi)
  @arq = File.read(path)
  @js = JSON.parse(@arq)
  @jsons = []





  @provas = Prova.new
  @provas.nome = @nome
  @provas.user_id = @idu
  @provas.save

  if(@online == 'sim')
 
 @alunos = Aluno.where('turma_id=?',@turma)

 @alunos.each do |a|
 @proalu = Provaaluno.new
 @proalu.prova_id = @provas.id
 @proalu.aluno_id = a.id
 @proalu.status = 1
 @proalu.data= @data
 @proalu.duracao = @duracao
 @proalu.mostraresultado = @mostraresultado
 @proalu.save

 @timer = @timer + 1 
end
end

  @js.each do |jss|

    @quepro = QuestaoProva.new
    @quepro.prova_id = @provas.id
    @quepro.questao_id = jss["id"]
    @quepro.save
     @timer = @timer + 1 
  end

 FileUtils.rm(path)



end    #@quepro.prova_id = @provas.id
    #@quepro.questao_id = @idq
    #@quepro.save




    respond_to do |format|
      format.js 

   
    end

    

  end


  def mostraprova

    ultimap = VwGeraprova.where("usuario=?",current_user.id).order("idprova desc limit 1").select("idprova") 

    #ultimap = Prova.order("id desc limit 1").select("id")
    ultimap.each do |up|
  #@questoes = QuestaoProva.joins("inner join provas on provas.id = questao_provas.prova_id left outer join questoes on questoes.id = questao_provas.id inner join respostas on respostas.pergunta_id = questoes.id ").where("provas.id=? and respostas.pergunta_id = questoes.id", up.id).select("questoes.descricao")
  #@respostas = QuestaoProva.joins("inner join provas on provas.id = questao_provas.prova_id riht outer join questoes on questoes.id = questao_provas.id inner join respostas on respostas.pergunta_id = questoes.id ").where("provas.id=? and respostas.pergunta_id = questoes.id", up.id).select("respostas.descricao as resposta")  
  @questoes = VwGeraprova.where("idprova = ? and usuario=?",up.idprova,current_user.id) 
end

respond_with(@object, filename: 'prova.docx', word_template: 'my_template.docx')


  #yomu = Yomu.new 'http://127.0.0.1:3000/geraprova'
  #text = yomu.text
end


def minhasprovas
  @provas = VwGeraprova.where("usuario=?", current_user.id).select("idprova, nome").group('nome, idprova') 

end

def mostraprovanovamente

    @idpro = params[:idpro]

    #ultimap = Prova.order("id desc limit 1").select("id")
  
  #@questoes = QuestaoProva.joins("inner join provas on provas.id = questao_provas.prova_id left outer join questoes on questoes.id = questao_provas.id inner join respostas on respostas.pergunta_id = questoes.id ").where("provas.id=? and respostas.pergunta_id = questoes.id", up.id).select("questoes.descricao")
  #@respostas = QuestaoProva.joins("inner join provas on provas.id = questao_provas.prova_id riht outer join questoes on questoes.id = questao_provas.id inner join respostas on respostas.pergunta_id = questoes.id ").where("provas.id=? and respostas.pergunta_id = questoes.id", up.id).select("respostas.descricao as resposta")  
  @questoes = VwGeraprova.where("idprova = ?",@idpro) 

respond_with(@object, filename: 'prova.docx', word_template: 'my_template.docx')


  #yomu = Yomu.new 'http://127.0.0.1:3000/geraprova'
  #text = yomu.text
end


def minhasprovas
  @provas = VwGeraprova.where("usuario=?", current_user.id).select("idprova, nome").group('nome, idprova') 

end




  def testeprova

    @idpro = params[:idpro]
    #ultimap = Prova.order("id desc limit 1").select("id")
    #ultimap.each do |up|
  #@questoes = QuestaoProva.joins("inner join provas on provas.id = questao_provas.prova_id left outer join questoes on questoes.id = questao_provas.id inner join respostas on respostas.pergunta_id = questoes.id ").where("provas.id=? and respostas.pergunta_id = questoes.id", up.id).select("questoes.descricao")
  #@respostas = QuestaoProva.joins("inner join provas on provas.id = questao_provas.prova_id riht outer join questoes on questoes.id = questao_provas.id inner join respostas on respostas.pergunta_id = questoes.id ").where("provas.id=? and respostas.pergunta_id = questoes.id", up.id).select("respostas.descricao as resposta")  
  @questoes = VwGeraprova.where("idprova = ?",@idpro) 
#end

#respond_with(@object, filename: 'my_file.docx', word_template: 'my_template.docx')


  #yomu = Yomu.new 'http://127.0.0.1:3000/geraprova'
  #text = yomu.text
end

def abremodal 

 respond_to do |format|
   format.js

 end
end


def get_via_ajax
 @idq = params[:idq]
 @idu = params[:idu]
 @tipo = params[:tipo]


 @nomeorigi = "quest_"+@idu+".json"
 path = File.join(Rails.root,"app/assets/images/provas",@nomeorigi)

 if(@tipo == 'add')

  if(!FileTest.exist?("#{Rails.root}/app/assets/images/provas/#{@nomeorigi}"))

    @jsons = []
    @json = {
      "id" => @idq,
      "usuario" => @idu
    }
    @jsons << @json
    File.open(path,"w") do |f|
      f.write(@jsons.to_json)
    end

  else
    @arq = File.read(path)
    @js = JSON.parse(@arq)        
    @json = {
      "id" => @idq,
      "usuario" => @idu        
    }
    @js << @json
        #Rails.logger.debug(@arq.to_json)
        #@js = @arq.to_json + @jsons.to_json
        File.open(path,"w") do |f|
          f.write(@js.to_json)
        end
      end

    else
      @arq = File.read(path)
      @js = JSON.parse(@arq)
      @jsons = []
      @js.each do |js|
       if(js["id"].to_i != @idq.to_i)
        @jsons << js
      end
    end
    File.open(path,"w") do |f|
      f.write(@jsons.to_json)
    end

  end#fim if add


  render :text => @foo.to_json
end


def adicionaquestao
  @idq = params[:id]
  @idquest = "questoes.json"
  path = File.join(Rails.root,"app/assets/images/",@idquest)
  @arq = File.read(path)
  @js = JSON.parse(@arq)

  @json = {
    "id" => @idq
  }


  @js << @json




end





def consulta_questao


  @nquali = params[:nquali]
  @squali = params[:squali]

  
  @pagen = 1
  if (params.has_key?(:page))
    @pagen = params[:page]
  end

  if(@nquali == 'nao' && params.has_key?(:descricao))
    @descricao = params[:descricao]
    @ret  = Questao.joins("left outer join auditas on auditas.questao_id=questoes.id left outer join useres on useres.id = auditas.useres_id").where('questoes.id  not in (select questao_id from questao_subgrupos where questao_id = questoes.id) and descricao ilike ?','%'+@descricao+'%').select('questoes.id as id, questoes.descricao as descricao, useres.nome_completo as email').order('questoes.id desc').paginate(:page => params[:page], :per_page => 10)
    @descri = @descricao
  elsif(@squali == 'sim' && params.has_key?(:descricao))
    @descricao = params[:descricao]
    @ret  = VwQuali.where('descricao ilike ?','%'+@descricao+'%').paginate(:page => params[:page], :per_page => 10)
    @descri = @descricao
  elsif (@squali == 'sim')
    @ret  = VwQuali.all.paginate(:page => params[:page], :per_page => 10)
    @descri = nil   
  elsif (@nquali == 'nao')
    @ret  = Questao.joins("left outer join auditas on auditas.questao_id=questoes.id left outer join useres on useres.id = auditas.useres_id").where('questoes.id  not in (select questao_id from questao_subgrupos where questao_id = questoes.id)').select('questoes.id as id, questoes.descricao as descricao, useres.nome_completo as email').order('questoes.id desc').paginate(:page => params[:page], :per_page => 10)
    @descri = nil      
  else
    @descricao = params[:descricao]
   # @ret  = Questao.joins("left outer join auditas on auditas.questao_id=questoes.id left outer join useres on useres.id = auditas.useres_id").where('descricao ilike ?','%'+@descricao+'%').select('questoes.id as id, questoes.descricao as descricao, useres.nome_completo as email').order('questoes.id desc').paginate(:page => params[:page], :per_page => 10)
   #@ret  = Questao.joins("left outer join auditas on auditas.questao_id=questoes.id left outer join useres on useres.id = auditas.useres_id").where('questoes.id = ?',@descricao).select('questoes.id as id, questoes.descricao as descricao, useres.nome_completo as email').order('questoes.id desc').paginate(:page => params[:page], :per_page => 10)
   @ret = ActiveRecord::Base.connection.select_all("select * from consulta_questao('#{@descricao}')").to_a.paginate(:page => params[:page], :per_page => 10)

   Rails.logger.debug(@ret)
   @descri = @descricao
 end

 
 @page = @ret

 

end

def destroy
  @prova.destroy
  respond_to do |format|
    format.html { redirect_to provas_url, notice: 'Prova was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_prova
      @prova = Prova.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prova_params
      params.require(:prova).permit(:nome)
    end
  end
