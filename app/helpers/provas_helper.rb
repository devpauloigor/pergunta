module ProvasHelper


	def Questsel(idu, contador)

        #---- Calculando a sugestão de minutos -----##
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

            @tamanhoquest+=qat.descricao+" "
             
            end
          end

          @js.each do |jss|
            @respostaq = Resposta.where('pergunta_id=?',jss["id"])
            @respostaq.each do |rpq|
            @tamanhoquest+=rpq.descricao
          end
            end

        end

                vetorquest = @tamanhoquest.split(" ")
                numerovetor = vetorquest.size
                @numerototal = vetorquest.size
                @sugestao =   (numerovetor.to_i / 80).ceil


        #----- Fim do calculo da sugestao -------##



        retorno = "<h1>questoes selecionadas</h1>"
        #retorno +=  "#{@tamanhoquest}"
        retorno +="<div class='form-group'>"
        retorno +="<label class='control-label'  for='focusedInput'>Nome da Prova</label>"
        retorno +="<input class='form-control' id='nomeprova'  type='text' placeholder='Digite o nome da prova'>"
        retorno +="<div class='checkbox'>"
        retorno +="<label>"
        retorno +="<input type='checkbox' id='chprovaon' name='ponline' class='ponline' onclick='proonline()'> Prova Online?"
        retorno +="</label>"
        retorno +="</div>"    
        retorno += "<select id='cbturma' style='display:none;'>"
        @turma = Turma.all
        @turma.each do |t|
        retorno +="<option value='#{t.id}'>#{t.descricao}</option>"
        end
        retorno += "</select>"
        retorno += "<input type='datetime-local'  id='dataprova' name='bdaytime' style='display:none;'>"
        retorno += "<label class='control-label' id='labeltempo'  for='focusedInput'  style='display:none;'>Tempo de Duração da Prova em minutos </label> "
        retorno += " <span class='badge' id='dicatempo' style='display:none;' title='Tempo sugerido para esta prova foi calculado baseando-se na informação de que uma pessoa consegue ler 150 palavras por minutos'>?</span>"
        retorno +="<input class='form-control' style='display:none;' id='duracao' type='text' value='#{@sugestao}'>"
        retorno +="<div class='checkbox' id='checkbox2' style='display:none;'>"
        retorno +="<label>"
        retorno +="<input type='checkbox' id='mostraresult' > Mostrar o resultado para o aluno após a prova?"
        retorno +="</label>"
        retorno +="</div>" 

        @nomeorigi = "quest_"+idu.to_s+".json"
        if(FileTest.exist?("#{Rails.root}/app/assets/images/provas/#{@nomeorigi}"))
         path = File.join(Rails.root,"app/assets/images/provas",@nomeorigi)
         @arq = File.read(path)
         @js = JSON.parse(@arq)
         @jsons = []
         @checado=" "
         @js.each do |js|



             @questselecionadas = Questao.where('id=?', js["id"].to_i).order('id asc')
             @respostas = Resposta.where("pergunta_id = ?", js["id"].to_i)

             @questselecionadas.each do |qq|     


                retorno +="<div class='modal-body' id='di#{qq.id}'>"
               	#Rails.logger.debug("Dados: #{qq.descricao}")
               	retorno += "<p id='pdescricao#{qq.id} '><b> #{qq.id} </b> -  #{qq.descricao}   </p>"
                  @textoremovido = Questao.where("id=?",qq.id)
                  @textoremovido.each do |ttm|
                    @tamanhoremove = ttm.descricao
                    @vetorremove = @tamanhoremove
                    end
                    @respremove = Resposta.where("pergunta_id=?", qq.id)
                    @respremove.each do |rpm|
                    @tamanhorespremote = rpm.descricao
                    @vetorremove+=@tamanhorespremote
                    end
                    vetorquestrem = @vetorremove.split(" ")
                    @numerovetor1 = vetorquestrem.size
                    @sugestaonova =   (@numerovetor1.to_f / 90).round
                     
                      retorno +="<p><a href='#' class='btn btn-primary btn-xs' id='btremove#{qq.id}' onclick= 'removenomodal( #{qq.id} ,"+contador+",  #{current_user.id}, #{@numerovetor1})'>Remover Questão da Prova</a></p>"
                     
                
                    

                  

               

               end
               @contt = 1
               @respostas.each do|rr|


                    #verificando qual a resposta correta
                    if rr.correta == 1
                    	@corret = "text-success" 

                    else
                    	@corret = "text-danger"                    



                    end
                    
                    retorno +=" <p id='palternativa#{rr.pergunta_id}cont#{@contt}  ' name='trete#{rr.pergunta_id} ' class='#{@corret} '><b>Alternativa:</b>   #{rr.descricao}   <p>  "

                    @contt += 1 
                end  

                retorno +=' </div>'

                retorno +='   <div class="modal-footer">'
                
                retorno +='   </div>'

            end
        end 
                        retorno +="<p id='vetortotal' hideen>#{@numerototal}</p>"
        return retorno.html_safe


    end




end
