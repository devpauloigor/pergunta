$(document).ready(function(){

  $("#txt_desc").autocomplete({

    source: '/tema/autocomplete.json',
    select: function(a,b){
      var DadosV = b.item.value.split(',');

       	//----------------------Split Grupo

       	var texto = DadosV[1]
       	var texto2 = DadosV[2]

      // 	alert(DadosV[0]);

      	//var comboGrupo= $('#selGrupo').val(DadosV[1]);
       //	var x = document.getElementById('#selGrupo');

       var textoCombo = texto.split(':');

       //var grupo = "option[text="+textoCombo[1].trim()+"]";
       var grupo = textoCombo[1].trim();
       $('#selGrupo option:contains('+grupo+')').attr("selected",true);
      //var x = document.getElementById("selGrupo");
      var y=$("#selGrupo").val();
     // alert(y);

     document.getElementById('selGrupo').disabled = true; 
     document.getElementById('selSubGrupo').disabled = true; 
   	  //var option = document.createElement("option");
      //option.text = textoCombo[1];
      //x.add(option);
      //x.selectedIndex="1";
    //------------------------Fim split grupo ------------------------------


    var textoCombo2 = texto2.split(':');
    var subgrupo = textoCombo2[1].trim();
    $('#selSubGrupo option:contains('+subgrupo+')').attr("selected",true);







    $('#txt_desc').val(DadosV[0]);

    document.getElementById('txt_desc').disabled = true;


  },

  appendTo: $('#dialog')





});





  $("#txt_desc1").focusout(function(){
  //alert("Saiu");
  $.get("/questao/valida_questao?descricao="+$("#txt_desc1").val(),function(result){


  });



});

  $("#testeresp").on('click',function() {
        //alert($(this).attr('id'));
        var  descricao = $("#txt_desc_resp").val().replace(/[\n\r]/g,"pulo");

        alert(descricao);
      });


  $("#txt_desc").focus(function(){
  //var url = "carregasubgrupo";
    //    $.get(url,function(result){
          //document.getElementById('selSubGrupo').disabled = true; 
          //alert(result);
      //  });

    });



$(function(){
    console.log('ready');

    $('.list-group li').click(function(e) {
        e.preventDefault()

        $that = $(this);

        $that.parent().find('li').removeClass('active');
        $that.addClass('active');
    });
})


  $("#selGrupo").change(function() {
    document.getElementById('selSubGrupo').disabled = false; 
    var url = "subgrupo?grupo="+$("#selGrupo").val();
    $.get(url,function(result){
        	//alert(result);
        });

    var url2 = "carregasubgrupo";
    $.get(url,function(result){
          //document.getElementById('selSubGrupo').disabled = true; 
          //alert(result);
        });


  });

  $(".input-group.date").datepicker({
    format: 'dd/mm/yyyy',
    language: "pt-BR",
    autoclose: true,
    todayHighlight: true
  });

  $(".datas").datepicker({
    format: 'dd/mm/yyyy',
    language: "pt-BR",
    autoclose: true,
    todayHighlight: true
  });


  $("#btnCancelaConsulta").click(function() {

    $("#txt_desc").val('');
    document.getElementById('txt_desc').disabled = false;
    document.getElementById('selGrupo').disabled = false; 

    document.getElementById('selSubGrupo').disabled = true; 
    var url = "subgrupo?grupo="+$("#selGrupo").val();

    var x = document.getElementById('selGrupo');
    x.selectedIndex= 0;

    $.get(url,function(result){
          //alert(result);
        });


  });


/*$("#btConsultar").click(function() {

  var url = '/questoes/consulta_questaonquali'

  if(document.getElementById('chknquali').checked==true)
  {
       //alert("Clicooou");
       url.reload();

  }



});*/


$("#nquali").click(function() { 

       //alert("Clicooou");
       document.getElementById('squali').checked=false

     });


$("#squali").click(function() {  


       //alert("Clicooou");
       document.getElementById('nquali').checked=false


     });

 /* $("#txt_desc").keydown(function(e) {



      if(e.keyCode == 8){

         var x = document.getElementById('selGrupo');
         x.selectedIndex= 0;

      document.getElementById('selGrupo').disabled = false; 
      document.getElementById('selSubGrupo').disabled = false; 
       //alert("apagou");

      }

    });*/



    $(".btquestao").on('click',function() {
        //alert($(this).attr('id'));
        var nome = "t"+$(this).attr('id');
        //alert(nome);
        $("#t"+$(this).attr('id')).toggle();
      });


    $('#cons_questao').click(function(){
      var descricao = $('#cons_tquestao').val();
      $.get("/questoes/consulta_questao?descricao="+descricao,function(result){

      });
    });



     //------------------teste de checagem -------------------------

     


     



     //-----------------------------------------------------------



   });



function provaupd(contador){

  var url = "/prova/provamodal?contador="+contador;
  $.get(url,function(result){});
}


function verificaChecks() {

  var aChk = document.getElementsByName("chkquali"); 
  for (var i=0;i<aChk.length;i++){ 

    if (aChk[i].checked == true){ 

      if (aChk[i].checked == true){ 


        alert(aChk[i].value + " marcado.");


              //---- teste --------//
              var idq=aChk[i].value;

              

              //-----------------------


            }  else {



            }

            //alert(aChk[i].value + " marcado.");


          }  else {



          }

        }

      }




      function removenomodal(idq,idx,user,vetpalavras){
        var vettotal = 0;
        var sugestao = 0;
        var novofeed = 0
        var feed = document.getElementById("contach").innerHTML

        novofeed = parseInt(feed) - 1

        vettotal = parseInt(document.getElementById("vetortotal").innerHTML)
        sugestao = parseInt(vettotal) - parseInt(vetpalavras);

        sugestao2 = (sugestao / 80)
        alert(sugestao);
         document.getElementById("duracao").value = Math.ceil(sugestao2);
          document.getElementById("vetortotal").innerHTML = sugestao;

          document.getElementById("contach").innerHTML = novofeed;
      //var quali = document.getElementsByName("chkquali"); 
      //var checado = $("#chkquali"+idx).is(':checked'); 
      var url = "/prova/get_via_ajax?idq="+idq+"&&idu="+user;
        url += "&&tipo=del";//verificando o tipo de alteração
        $.get(url,function(data){});//passando por get via ajax
       // alert(idq+" "+idx+" não checado "+user);
       document.getElementById("btremove"+idq).style.visibility = "hidden";
       document.getElementById("di"+idq).style.visibility="hidden";
      
      // alert(vetpalavras);
       // document.getElementById("pdescricao"+idq).textContent= "Questão Removida";
        //document.getElementById("palternativa"+idq+"cont1").style.visibility = "hidden";
        //document.getElementById("palternativa"+idq+"cont2").style.visibility = "hidden";
        //document.getElementById("palternativa"+idq+"cont3").style.visibility = "hidden";
        //document.getElementById("palternativa"+idq+"cont4").style.visibility = "hidden";
        //document.getElementById("palternativa"+idq+"cont5").style.visibility = "hidden";     

      }


      function abremodal(){

        var url = "/prova/abremodal";

       $.get(url,function(data){});//passando por get via ajax
        //alert(idq+" "+idx+" não checado "+user);      

      }

function Initsession(id, aluno_id){
     var url = "/iniciasecao?id="+id+"&&aluno_id="+aluno_id;
     
        $.get(url,function(data){});

}


      function addQuest(idq,idx,user){


            
      //var quali = document.getElementsByName("chkquali"); 


      var checado = $("#chkquali"+idx).is(':checked'); 

      var contac=  parseFloat(document.getElementById("contach").innerHTML);


      var url = "/prova/get_via_ajax?idq="+idq+"&&idu="+user;
      if(checado){

        url += "&&tipo=add";//verificando o tipo de alteração
        $.get(url,function(data){});//passando por get via ajax
        // alert(idq+" "+idx+" Foi checado "+user);

        var s3 =  parseFloat(contac) +  parseFloat(1);
        //alert(s3);
        document.getElementById("contach").textContent= parseFloat(s3);


      }
      else{
        $("chkquali"+idx).prop("checked", false);
        //document.getElementById("chkquali"+idx).checked = false;

        url += "&&tipo=del";//verificando o tipo de alteração
        $.get(url,function(data){});//passando por get via ajax
        //alert(idq+" "+idx+" não checado "+user);

        var s3 =  parseFloat(contac) -  parseFloat("1");
       // alert(s3);
       document.getElementById("contach").textContent= parseFloat(s3);

     }

}//Fim addQuest

function DesmarcaResp(idq,user,questao, page){
  var option = $('.cities');
  option.prop('checked',false);
    var aumentaresp = 0;
      var numeroderesp=  document.getElementById("qtdrespondidas").innerHTML
       document.getElementById("validadorcont").innerHTML = "false"
      diminuiresp = parseInt(numeroderesp) - 1; 

      //alert(numeroderesp);
      document.getElementById("qtdrespondidas").innerHTML = diminuiresp.toString();

  var questaoatual= document.getElementById("qatual").innerHTML;
  document.getElementById("elerespondeu"+page).className = "";
   document.getElementById("btndesmarca").style.visibility = "hidden";
  //var dataprova= $('#dataprova').val();


  //alert(questaoatual);
  RemoveResp(questaoatual,user,questao, page);


}

$('.cities').on('click',function(e){


  document.getElementById("btndesmarca").style.display = '';


  var option = $(this);
  $('.cities').prop('checked','');

  option.prop('checked','checked');      

});



function proonline(){

 var checado = $("#chprovaon").is(':checked'); 
  alert("bateu");
  if(checado){
    document.getElementById("cbturma").style.display = 'block';
    document.getElementById("dataprova").style.display = 'block';
    document.getElementById("duracao").style.display = '';
    document.getElementById("dicatempo").style.display = '';
    document.getElementById("labeltempo").style.display = '';
    document.getElementById("checkbox2").style.display = 'block';
  }else{
    document.getElementById("cbturma").style.display = 'none';
    document.getElementById("dataprova").style.display = 'none';
    document.getElementById("dicatempo").style.display = 'none';
    document.getElementById("duracao").style.display = 'none';
    document.getElementById("labeltempo").style.display = 'none';
  }

}



function addResp(idq,user,questao, page, provaalunos){


  
  document.getElementById("qatual").innerHTML =  idq;
  document.getElementById("elerespondeu"+page).className = "glyphicon glyphicon-ok text-success";
      //var quali = document.getElementsByName("chkquali"); 
      var checado = $("#radioresp"+idq).is(':checked'); 
    // var checado =       $('.cities').prop('checked','');
       var validacontagem = document.getElementById("validadorcont").innerHTML;
       var aumentaresp = 0;
      var numeroderesp=  document.getElementById("qtdrespondidas").innerHTML;

      if(validacontagem == "false" ){
      aumentaresp = parseInt(numeroderesp) + 1; 

      //alert(numeroderesp);
      document.getElementById("qtdrespondidas").innerHTML = aumentaresp.toString();
      document.getElementById("validadorcont").innerHTML = "true"
    }



     // var contac=  parseFloat(document.getElementById("contach").innerHTML);
     var url = "/resposta/get_via_ajax?idq="+idq+"&&idu="+user+"&&questao="+questao+"&&numero="+page+"&&provaalunos="+provaalunos;

     if(checado && questao != document.getElementById("vetor").innerHTML ){

        //document.getElementById("elerespondeu").className = "glyphicon glyphicon-ok";
        //alert("respondeeu");
      url += "&&tipo=add"; //verificando o tipo de alteração
      $.get(url,function(data){}); //passando por get via ajax
        // alert(idq+" "+idx+" Foi checado "+user);
        document.getElementById("vetor").innerHTML = questao;
        document.getElementById("qantiga").innerHTML = idq;
      //var s3 =  parseFloat(contac) +  parseFloat(1);
        //alert(s3);
     // document.getElementById("contach").textContent= parseFloat(s3);

   }
   else{
       // alert(validacontagem);
        //document.getElementById("radioresp"+idq).checked = false;
        //$("#radioresp"+idq).prop("checked", false);
        //document.getElementById("radioresp"+idq).checked = false;        
        //document.getElementById("elerespondeu").className = "glyphicon glyphicon-ok";
        idqa=document.getElementById("qantiga").innerHTML
        var url = "/resposta/get_via_ajax?idq="+idqa+"&&idu="+user+"&&questao="+questao+"&&numero="+page+"&&provaalunos="+provaalunos;
        url += "&&tipo=del";//verificando o tipo de alteração
        //alert("Deschecado url:"+url);
        $.get(url,function(data){});//passando por get via ajax

       
        
      
        
        var url2 = "/resposta/get_via_ajax?idq="+idq+"&&idu="+user+"&&questao="+questao+"&&numero="+page+"&&provaalunos="+provaalunos;
        url2 += "&&tipo=add"; //verificando o tipo de alteração
        $.get(url2,function(data){});
        //alert(idq+" "+idx+" não checado "+user);
        document.getElementById("qantiga").innerHTML = idq;
      
       //  var s3 =  parseFloat(contac) -  parseFloat("1");
       // alert(s3);
        //document.getElementById("contach").textContent= parseFloat(s3);

      }


}//Fim Add Resp


function RemoveResp(idq,user,questao, page, provaalunos){

  var url = "/resposta/get_via_ajax?idq="+idq+"&&idu="+user+"&&questao="+questao+"&&numero="+page+"&&provaalunos="+provaalunos;
        url += "&&tipo=del";//verificando o tipo de alteração
       // alert("Deschecado url:"+url);
        $.get(url,function(data){});
}




function CadSubGrupo(grupo){
 var url ='cadsubgrupo';
 var descricao= $('#txt_desc').val();
 url += '?nome='+descricao+'&&grupo_id='+grupo;

  // window.alert(url);
  $.get(url,function(result){


  });
  var descricao= $('#txt_desc').val(" ");

}

function cadresult(idu, operador){


  var validacontagem = document.getElementById("validadorcont").innerHTML;
  var numeroderesp=  document.getElementById("qtdrespondidas").innerHTML;

    
    

 
    var aumentaresp = 0;
    var qtdresp =  document.getElementById("qtdrespondidas").innerHTML;
    var totalquest = document.getElementById("qtdtotalquest").innerHTML;
    var textoquest = "";
    var textoquest1 = "";
    aumentaresp = (parseInt(totalquest) - parseInt(qtdresp)); 

    var mensagem = "";
  
  
if(parseInt(aumentaresp) == 1){
      textoquest1 = "Existe"
      textoquest = "questão sem resposta deseja terminar?";
    }else{
       textoquest1 = "Existem"
       textoquest = "questões sem resposta deseja terminar?";
    }
 if(operador == 1){
      var url= '/cadresultado'
  url += '?idu='+idu;
    $.get(url,function(result){

  });
    

 }else{

    if(parseInt(aumentaresp) > 0){
    //alert(textoquest);

      mensagem = textoquest1+" "+aumentaresp+" "+textoquest;
    }else{
      mensagem = "Deseja realmente finaliza a prova?"
    }

  var r = confirm(mensagem);
  if (r == true) {

    var url= '/cadresultado'
    url += '?idu='+idu;
    $.get(url,function(result){

    });
    
} 
}





}

function CadPro(idu){

  var url ='cadprova';
  var nome= $('#nomeprova').val();
   var turma= $('#cbturma').val();
   var dataprova= $('#dataprova').val();
   var duracao= $('#duracao').val();
   var checado = $("#chprovaon").is(':checked'); 
   var checadomostra = $("#mostraresult").is(':checked'); 
   var sim = "sim";
    var nao = "não";
    var mostra = 0;
    if(checadomostra){
      mostra = 2;
    }else{
      mostra = 1;
    }


  if(checado){

  url += '?nomeprova='+nome+'&&idu='+idu+'&&online=sim'+'&&turma='+turma+'&&data='+dataprova+'&&duracao='+duracao+'&&mostraresultado='+mostra;
    //url += '?descricao='+descricao+'&&sub_grupo_id='+SubGrupo+'&&questao_id='+questao;
}else{
   url += '?nomeprova='+nome+'&&idu='+idu+'&&online=nao'+'&&turma='+turma;
 }
    if($($("#nomeprova").val() ==null ||"#nomeprova").val() =="#dataprova"){
      alert('Preencha o campo Nome da Prova');
      document.getElementById("nomeprova").focus();

    }else{
  //window.alert(url);
  $.get(url,function(result){

  });

  document.getElementById("btncadpro").disabled=true

 //setInterval(function(){ }, 5000);
   //document.getElementById("progress-bar").style.visibility = "true";
//iniciando progressbar

//move();
//fim



}

    //$("#subgrupo_id :selected").remove();
  }

  function move(timer) {
    var elem = document.getElementById("progress-bar"); 
    var width = 10;
    var id = setInterval(frame, timer);
    function frame() {
      if (width >= 100) {
        clearInterval(id);
      } else {
        width++; 
        elem.style.width = width + '%'; 
      }
      window.location = "/geraprova.docx";  
    }
    
  }

  function Geranovamente(idprova){
    var url ='/testeprova';
    url += '?idpro='+idprova;
     // alert(idprova);
     window.location =url; 


   }

   function Exportarprova(idprova){
    var url ='/geraprovan.docx';
    url += '?idpro='+idprova;
     // alert(idprova);
     window.location =url; 


   }

//------------------lotando o json---------------------------
function selecionaquest(cont){

  //---------------- verificando a qtd de checks selecionados---------------------------



  var contac= $('#contac').val();

  var aChk = document.getElementsByName("chkquali"); 
  for (var ii=0;ii<aChk.length;ii++){ 

    if (aChk[ii].checked == true){ 

      if (aChk[ii].checked == true){ 


          // alert(aChk[i].value + " marcado.");

          
          
              //---- teste --------//
              var idq=aChk[ii].value;

              contac++

              document.getElementById("push").textContent=contac;
              

              //-----------------------
            }


          }  


          if (aChk[ii].checked == false){ 

            if (aChk[ii].checked == false){ 


          // alert(aChk[i].value + " marcado.");

          
          
              //---- teste --------//
              var idq=aChk[ii].value;
              
              contac-1

              document.getElementById("contach").textContent=contac;
              

              //-----------------------
            }


          }  


            //alert(aChk[i].value + " marcado.");
          }




  //------------- fim da verificação dos checks selecionados----------------------

  

  var quali = "";
  var c = 0;
  
  for(var i=0; i< cont; i++){


    if($('#chkquali'+i).is(':checked')){
      if(c==0){

       quali += $('#chkquali'+i).val();
       c+=1;



     }
     else{

      quali +="|"+$('#chkquali'+i).val();

    }
      //alert(quali);


    } 

     //----------------------------####teste populando o Json#########-------------------------------




    //----------------------------####fim populando o Json#########-------------------------------


  }

  




}//fim selecionaquest


function getAjaxFoo(id) {
  $.ajax({
    type: "POST",
    url: '/provas/get_via_ajax',
    data: {id: id},   
    success: function(json) {
      var foo = $.parseJSON(json);
      alert(foo.id); // alert(foo.name);

    }
  });
}



//------------------------------------------------------------------



function NovoQualificar(cont){

 if (document.getElementById('selGrupo').value == 0){

  alert("Selecione um grupo e sub grupo");

}else{


  var url ='cadnovotema';

  var quali = "";
  var c = 0;
  
  for(var i=0; i< cont; i++){


    if($('#chkquali'+i).is(':checked')){
      if(c==0){

       quali += $('#chkquali'+i).val();
       c+=1;

     }
     else{

      quali +="|"+$('#chkquali'+i).val();
    }

  } 

}
//--------------------- teste split ----------------
var x = document.getElementById('selGrupo');
var y = document.getElementById('selSubGrupo');

if(  document.getElementById('txt_desc').disabled == true){

  var txt = $('#txt_desc').val();
  var DadosV = txt.split(',');
  var texto = DadosV[3];
  var idtema = texto.split(':');

   //alert("funfou o if");
  // var tema_id= $('#tema_id').val();
  var tema_id= idtema[1];
   //url += '?tema_id='+tema_id+'&&questao_id='+pergunta;



   url += '?quali='+quali+'&&tema_id='+tema_id;


   $.get(url,function(result){


   });
   
   $("#txt_desc").val(" ");
   document.getElementById('txt_desc').disabled = false;


   x.selectedIndex= 0;


   y.selectedIndex= 0;

   document.getElementById('selGrupo').disabled = false; 

   document.getElementById('selSubGrupo').disabled = true; 


   carregapag()
//----------------fim teste split  

  }//fim if
  else{

   var txt = $('#txt_desc').val();
   var SubGrupo = $('#selSubGrupo').val();
   CadTemaNovo(SubGrupo,txt,quali);
 }

}//fim do else q valida 



}//fim do novo qualificar



function teste(pergunta){
 var descricao= $('#txt_desc').val();
 var correta= $('#sel_correta').val(); 	 

 window.alert (descricao +" "+ correta +" "+pergunta);

}


function CadResp(pergunta){

 if(document.getElementById("txt_desc_resp").value  == " ")
 {
   window.alert("Campo descrição está vazio");

 }else{

   var url ='cadresposta';
   var descricao= encodeURIComponent($('#txt_desc_resp').val());
   var correta= $('#sel_correta').val();
   url += '?descricao='+descricao+'&&correta='+correta+'&&pergunta_id='+pergunta;

 	  // window.alert(url);


    $.get(url,function(result){


    });
    var descricao= $('#txt_desc_resp').val("");
    var correta= $('#sel_correta').val(0);
  }
}


function validaquestao(){

 var url ='valida_questao';
 var descricao= $('#txt_desc1').val()

 url += '?descricao='+descricao;

    // window.alert(url);
    $.get(url,function(result){




    });
    
  }




  function CadSubGrupo(grupo){
   var url ='cadsubgrupo';
   var descricao= $('#txt_desc').val();
   url += '?nome='+descricao+'&&grupo_id='+grupo;

 	// window.alert(url);
  $.get(url,function(result){


  });
  var descricao= $('#txt_desc').val(" ");

}

function CadTema(SubGrupo){


	var url ='cadtemas';
	var descricao= $('#txt_desc').val();
  url += '?descricao='+descricao+'&&sub_grupo_id='+SubGrupo;
  
 	//window.alert(url);
  $.get(url,function(result){


  });

    //$("#subgrupo_id :selected").remove();
  }

  function CadTema2(SubGrupo,descricao, questao){


    var url ='cadtemas';
  //var descricao= $('#txt_desc').val();
  url += '?descricao='+descricao+'&&sub_grupo_id='+SubGrupo+'&&questao_id='+questao;
  
  //window.alert(url);
  $.get(url,function(result){


  });

    //$("#subgrupo_id :selected").remove();
  }



  function CadTemaNovo(SubGrupo,descricao,quali){


    var url ='cadtemasnovo';
  //var descricao= $('#txt_desc').val();
  url += '?descricao='+descricao+'&&sub_grupo_id='+SubGrupo+'&&quali='+quali;
  
  //window.alert(url);
  $.get(url,function(result){


  });

    //$("#subgrupo_id :selected").remove();
    carregapag()
  }



  function CadRespSubgrupo(pergunta){

   var url ='cadrespostasubgrupo';

//---------------------------------------------------

  //alert(idtema[1]);

//-----------------------------------------------
var x = document.getElementById('selGrupo');
var y = document.getElementById('selSubGrupo');

if(  document.getElementById('txt_desc').disabled == true){

  var txt = $('#txt_desc').val();
  var DadosV = txt.split(',');
  var texto = DadosV[3];
  var idtema = texto.split(':');

   //alert("funfou o if");
	// var tema_id= $('#tema_id').val();
 var tema_id= idtema[1];
	 //url += '?tema_id='+tema_id+'&&questao_id='+pergunta;
	 url += '?questao_id='+pergunta+'&&tema_id='+tema_id;


	 $.get(url,function(result){


   });
	 
   $("#txt_desc").val(" ");
   document.getElementById('txt_desc').disabled = false;


   x.selectedIndex= 0;


   y.selectedIndex= 0;

   document.getElementById('selGrupo').disabled = false; 

   document.getElementById('selSubGrupo').disabled = true; 



 }else if( x.selectedIndex== 0 ||  y.selectedIndex== 0 ){
    //Codigo para cadastrar um novo tema

    alert("Preencha e selecione todos os campos");



  }else{

   var txt = $('#txt_desc').val();
   var SubGrupo = $('#selSubGrupo').val();
   CadTema2(SubGrupo,txt,pergunta);
 }





}



function CadRegist(){
  var url ='/cadregistro';

  var nome= $('#txt_nome').val();
  var email= $('#txt_email').val();
  var perfil= $('#txt_perfil').val();
  var password= $('#txt_password').val();
  var password_confirmation= $('#txt_password_confirmation').val();


  url += '?nome='+nome+'&&email='+email+'&&perfil='+perfil+'&&password='+password+'&&password_confirmation='+password_confirmation;
  

  $.get(url,function(result){
   window.alert(url);

 });


}




function carregapag(){
	location.reload();
}

