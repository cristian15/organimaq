Rails.application.routes.draw do
 

  get 'facturas/index'

  get 'facturas/show'

  get 'facturas/edit'

  get 'facturas/new'

  get 'tipo_facturas/index'

  get 'tipo_facturas/new'

  get 'proveedors/index'

  get 'proveedors/show'

  get 'proveedors/edit'

  get 'proveedors/new'

  get 'orden_trabajos/index'

  get 'orden_trabajos/show'

  get 'orden_trabajos/new'

  get 'orden_trabajos/edit'

  get 'repuestos_planificacions/index'

  get 'repuestos_planificacions/new'

  get 'infractions/new'

  get 'infractions/index'

  get 'infractions/show'

  get 'infractions/edit'

  get 'multas/index'

  get 'multas/new'

  get 'multas/show'

  get 'multas/edit'

  get 'operadors/index'

  get 'operadors/new'

  get 'operadors/show'

  get 'operadors/edit'

  get 'arriendos/new'

  get 'arriendos/index'

  get 'arriendos/show'

  get 'arriendos/edit'

  get 'reports/new'

  get 'reports/index'

  get 'reports/show'

  get 'reports/edit'

  get 'clientes/new'

  get 'clientes/index'

  get 'clientes/edit'

  get 'clientes/show'

  get 'mecanicos_planificacions/index'

  get 'mecanicos_planificacions/edit'

  get 'mecanicos_planificacions/show'

  get 'mecanicos_planificacions/new'

  get 'tipo_mecanicos/index'

  get 'tipo_mecanicos/edit'

  get 'tipo_mecanicos/new'

  get 'mecanicos/index'

  get 'mecanicos/edit'

  get 'mecanicos/show'

  get 'mecanicos/new'

  get 'tipo_repuestos/index'

  get 'tipo_repuestos/new'

  get 'tipo_repuestos/edit'

  get 'repuestos/index'

  get 'repuestos/show'

  get 'repuestos/new'

  get 'repuestos/edit'

  get 'planificacions/index'

  get 'planificacions/new'

  get 'planificacions/edit'

  get 'planificacions/show'

  get 'estado_maquinas/index'

  get 'estado_maquinas/edit'

  get 'estado_maquinas/new'

  #get 'contacto' => "contacto#index"    # Contancto

  get 'welcome/index'   # Ruta Inicio

  get 'maquinas/new' =>'maquinas#new'   # Rutas maquinas

  get 'tipo_maquinas/new' =>'tipo_maquinas#new'


  root 'welcome#index'

  match '/contactos',     to: 'contactos#new',             via: 'get'

  resources "contactos", only: [:new, :create]

  

  resources :maquinas 

  resources :tipo_maquinas

  resources :estado_maquinas

  resources :planificacions

  resources :repuestos

  resources :tipo_repuestos

  resources :tipo_mecanicos

  resources :mecanicos

  resources :mecanicos_planificacions
  
  resources :clientes
  
  resources :reports
  
  resources :arriendos
  
  resources :operadors
  
  resources :multas
  
  resources :infractions
  
  resources :repuestos_planificacions
  
  resources :orden_trabajos
  
  resources :proveedors
  
  resources :tipo_facturas
  
  resources :facturas
  
  
  


  


end
