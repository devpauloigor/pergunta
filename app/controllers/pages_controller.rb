class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index

    @usuario= User.all



  end


  def fimdeprova


  end

  def provacriada
       

    @idprova = params[:idprova]

    #ultimap = Prova.order("id desc limit 1").select("id")
  
  #@questoes = QuestaoProva.joins("inner join provas on provas.id = questao_provas.prova_id left outer join questoes on questoes.id = questao_provas.id inner join respostas on respostas.pergunta_id = questoes.id ").where("provas.id=? and respostas.pergunta_id = questoes.id", up.id).select("questoes.descricao")
  #@respostas = QuestaoProva.joins("inner join provas on provas.id = questao_provas.prova_id riht outer join questoes on questoes.id = questao_provas.id inner join respostas on respostas.pergunta_id = questoes.id ").where("provas.id=? and respostas.pergunta_id = questoes.id", up.id).select("respostas.descricao as resposta")  
  @questoes = VwGeraprova.where("idprova = ?",@idprova) 
  end

   def fimdeprovanota
    @provaaluno = params[:idresultado]

    @questoes = Resultado.where('provaaluno_id=?', @provaaluno)





  end

  def iniciasecao



    @id = params[:id]
    @aluno_id = params[:aluno_id]
    

   
  ##_______________ teste Toxico _________________________##

   @questoesJ = Questao.joins("inner join questao_provas on questoes.id = questao_provas.questao_id inner join provas on provas.id = questao_provas.prova_id").where("provas.id=?",@id).select(" questoes.id as idquestao, questoes.descricao, provas.id as idprova, questao_provas.id as quesproid").order("random()") #.take.descricao

   @nomequest = "prova_"+current_user.id+".json"
   path = File.join(Rails.root,"app/assets/images/respostas",@nomequest)
   @questoesJ.each do |qj|
   if(!FileTest.exist?("#{Rails.root}/app/assets/images/respostas/#{@nomequest}"))

      @jsons = []
      @json = {
        "id" => qj.idquestao,
        "descricao" => qj.descricao,
            }
         
      @jsons << @json
      File.open(path,"w") do |f|
        f.write(@jsons.to_json)
         end
   
      else
      @arq = File.read(path)
      @js = JSON.parse(@arq)        
      @json = {
        "id" => qj.idquestao,
        "descricao" => qj.descricao,     
      }
      @js << @json
        #Rails.logger.debug(@arq.to_json)
        #@js = @arq.to_json + @jsons.to_json
        File.open(path,"w") do |f|
          f.write(@js.to_json)
        end
      end
   end

   ##_______________Fim _____________________________________________




    iddaprova = Provaaluno.where("prova_id=? and aluno_id=?",@id,@aluno_id)

    iddaprova.each do |iddp|

      @idd = iddp.id
      @durac = iddp.duracao
    end

    if(@durac <=30 )
    Provaaluno.update(@idd, :status => 2, :data => DateTime.current.to_time )
   else
    Provaaluno.update(@idd, :status => 2)
   end




    respond_to do |format|
    format.js 
    end


  

  end


  def get_via_ajax
   @idq = params[:idq]
   @idu = params[:idu]
   @questao = params[:questao]
   @tipo = params[:tipo]
   @numero = params[:numero]
   @provaalunos = params[:provaalunos]


   @nomeorigi = "quest_"+@idu+".json"
   path = File.join(Rails.root,"app/assets/images/respostas",@nomeorigi)

   if(@tipo == 'add')

    if(!FileTest.exist?("#{Rails.root}/app/assets/images/respostas/#{@nomeorigi}"))

      @jsons = []
      @json = {
        "id" => @idq,
        "usuario" => @idu,
        "questao" => @questao,
        "numero" => @numero,
        "provaalunos" => @provaalunos
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
        "usuario" => @idu,
        "questao" => @questao,
        "numero" => @numero,
        "provaalunos" => @provaalunos      
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




def quiz
		#@questoes = Questao.joins("left outer join audits on audits.auditable_type='Questao' and audits.auditable_id=questoes.id and audits.action='create' left outer join useres on useres.id=audits.user_id").select("questoes.id,questoes.descricao,useres.nome_completo as email").order('questoes.id desc').paginate(:page => params[:page], :per_page => 10)   
    @js=[""]
		id = params[:idprova]
    @id = params[:idprova]
    @idu = current_user.id
    @questoes = Questao.joins("inner join questao_provas on questoes.id = questao_provas.questao_id inner join provas on provas.id = questao_provas.prova_id").where("provas.id=?",id).select(" questoes.id as idquestao, questoes.descricao, provas.id as idprova, questao_provas.id as quesproid").order("random()").paginate(:page => params[:page], :per_page => 1)

     #--------------------- percorrendo o json randominco ----------------------------#
     @nomequest = "prova_"+@current_user.id.to_s+".json"
    if(FileTest.exist?("#{Rails.root}/app/assets/images/respostas/#{@nomequest}"))
     path = File.join(Rails.root,"app/assets/images/respostas",@nomequest)
     @arq = File.read(path)
     @js = JSON.parse(@arq)
     @jsons = []

    else
     
     end #end if file exist
     
     @js.each do |jss|
      @descr= jss["descricao"]
      
    
      end # fim do cr

     #-----------------------Fim do percorrendo o json--------------------------------



    @pagen = 1
    if (params.has_key?(:page))
     @pagen = params[:page]
   end

    @nomeorigi = "resp_"+@idu.to_s+".json"
    if(FileTest.exist?("#{Rails.root}/app/assets/images/respostas/#{@nomeorigi}"))
     path = File.join(Rails.root,"app/assets/images/respostas",@nomeorigi)
     @arq = File.read(path)
     @js = JSON.parse(@arq)
     @jsons = []


		 end #end if file exist





end

def areaprofessor
  @turmas = Turma.all

end

def cadresultado


    #@idu = current_user.id  
    @idu = params[:idu]

    Rails.logger.debug("qualquer coisa")
    @nomeorigi = "quest_"+@idu.to_s+".json"
    if(FileTest.exist?("#{Rails.root}/app/assets/images/respostas/#{@nomeorigi}"))
     path = File.join(Rails.root,"app/assets/images/respostas",@nomeorigi)
     @arq = File.read(path)
     @js = JSON.parse(@arq)
     @jsons = []

    else
      redirect_to :controller => 'pages', :action => 'fimdeprova'
     end #end if file exist
     
     @js.each do |jss|
      @provaalunosUp = jss["provaalunos"]
      @correct = Resposta.where("id = ?", jss["id"]) 
      @correct.each do |cr|
        @correta = cr.correta
      end # fim do cr

      @resultado = Resultado.new
      @resultado.provaaluno_id = jss["provaalunos"]
      @resultado.questao_id = jss["questao"]
      @resultado.resposta_id = jss["id"]
      @resultado.correta = @correta
      @resultado.save


    end  #fim do
    FileUtils.rm(path)

    respond_to do |format|
      format.js 
    end



  end

   
 end

 


