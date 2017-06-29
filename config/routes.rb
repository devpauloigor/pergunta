Rails.application.routes.draw do

  
  resources :resultados
  resources :tempandos
  resources :respostaalunos
  resources :provaalunos
  resources :alunos
  resources :alunos
  resources :turmas
  resources :questao_provas
  resources :provas
  resources :temas
  resources :auditas
  resources :auditorias



  resources :questao_subgrupos
  resources :pergunta_subgrupos
  resources :sub_grupos
  resources :grupos
  resources :respostas
  resources :questoes
  resources :perguntas
  
  resources :useres

 devise_for :users, :controllers => { :registrations => "users/registrations" }
 #devise_for :users, controllers: {sessions: 'useres/sessions'}

  get 'pages/index'
  get 'pages/fimdeprova'
  get 'pages/fimdeprovanota'
   get 'pages/provacriada'
  get 'pages/quiz'
  get "cadresposta" => "respostas#cadresposta"
  get "cadsubgrupo" => "sub_grupos#cadsubgrupo"
  get "qualificacoes" => "questao_subgrupos#qualificacoes"
 
  get "cadrespostasubgrupo" => "questao_subgrupos#cadrespostasubgrupo"
  get "page/:id" => "page#index", :as => :page
  get 'home/index'
  get "relatorioqtdquestoes" => "questoes#relatorio_qtdquestoes"
  get "relatoriomediaminuto" => "questoes#rel_quest_media_hora"
  get "relatorioqtdrespostas" => "respostas#relatorio_qtdrespostas"
  get "cadregistro" => "registros#cadregistro" 

  get "cadtemas" => "temas#cadtemas"
  get "cadtemasnovo" => "temas#cadtemasnovo"

  get "registros" => "users/registros#registros"

  get '/tema/autocomplete' => 'questao_subgrupos#autocomplete'
  get '/iniciasecao' => 'pages#iniciasecao'
  get '/areadoprofessor' => 'pages#areaprofessor'
  get "subgrupo" => "questao_subgrupos#subgrupo"
  get "carregasubgrupo" => "questao_subgrupos#carregasubgrupo"

  get '/questao/consulta_questao' => 'questoes#consulta_questao'
  get '/prova/consulta_questao' => 'provas#consulta_questao'


  get "novoqualificacoes" => "questao_subgrupos#novoqualificacoes"
  get "/questao/valida_questao" => "questoes#valida_questao"
  get "cadnovotema" => "questao_subgrupos#cadnovotema"

  get "mostraresp" => "questao_subgrupos#mostraresp"

  get "bancodequestoes" => "provas#bancoquestao"
  

  post '/questao/consulta_questao' => 'questoes#consulta_questao'
  post '/questoes/consulta_questaonquali' => 'questoes#consulta_questaonquali'
  post 'novoqualificacoes' => 'questao_subgrupos#novoqualificacoes'
  post "bancodequestoes" => "provas#bancoquestao"
  post "/provas/get_via_ajax" => "provas#get_via_ajax"


  get '/provas/adicionaquestao' => 'provas#adicionaquestao'

  get "/prova/get_via_ajax" => "provas#get_via_ajax"
  get "/resposta/get_via_ajax" => "pages#get_via_ajax"


  get "cadprova" => "provas#cadprova"
  get "/cadresultado" => "pages#cadresultado"
  get "/prova/abremodal" => "provas#abremodal"
  get "/prova/provamodal" => "provas#provamodal"
  get "geraprova" => "provas#mostraprova"
  get "/geraprovan" => "provas#mostraprovanovamente"
  get "/testeprova" => "provas#testeprova"
  get "minhasprovas" => "provas#minhasprovas"
  
 
  root to: "questoes#index"
  get "aviso" => "pages#aviso"

  devise_scope :user do
   get "signup", to: "useres#new"
   get "login", to: "useres/sessions#new"
   get "logout", to: "useres/sessions#destroy"
end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
