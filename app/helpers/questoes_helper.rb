module QuestoesHelper


def Qualificado(questao)
	    @ret = ""
	#@qualificacao = QuestaoSubgrupo.joins('inner join temas on questao_subgrupos.tema_id = temas.id where questao_subgrupos.questao_id =?',questao.to_i).select('temas.descricao')
	#qualificado = QuestaoSubgrupo.joins('inner join temas on questao_subgrupos.tema_id = temas.id').where('questao_subgrupos.questao_id=?',questao).select('temas.descricao')
	qualificado = VwLegenda.where('id=?',questao).order('legenda asc')
	qualificado.each do |quali|
		"<font color='#000000'>"+ @ret += quali.legenda+"<br>""</font>"
	end

    return @ret.html_safe
end


def Calcdata(dataatual, dataprova)
  segundos = ((dataprova - dataatual) / 60)
  
  return segundos.to_i

end


def Resposta(questao)

       idx = 0


      letras = Array.wrap(["A","B","C","D","E","F","G","H","I","J","K"])


	    @ret = ""
        
       @respostas1 = Resposta.where("pergunta_id = ?",questao)

      #Rails.logger.debug("Log da resposta: #{@respostas1.size}")

       @respostas1.each do |resposta|

        #Rails.logger.debug("essa foi a resposta: #{resposta.descricao}")
       

       if resposta.correta == 1
          
           @corr = "text-success"

        else
                
         @corr = "text-danger"
      end
       #Rails.logger.debug("essa foi a resposta2 : #{resposta.descricao}")   
		@ret += "<span class='"+@corr+"'>"+letras[idx]+") -  "+resposta.descricao+"<br>""</span>"

    idx+=1

	end

    return @ret.html_safe
end

end
