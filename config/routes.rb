Rails.application.routes.draw do
  # devise_for :users
  root to: 'home#index'
  devise_for :user, controllers: { registrations: 'registrations' }
  resources :order
  resources :contact

  resources :store do
    resources :bank_account
    resources :provider
    resources :product do
      member { get 'file_in_server' }
    end
  end

### BD MYSQL PARA TESTING API
=begin

  user: inacap
  pass: inacap123

  user: gabo
  pass: inacap123
  
=end


# http://138.197.40.153/apiKrt/pedidos.php?id_user=1
# {
#  "status": 1,
#  "data": [
#    {
#      "id_pedido": "1",
#      "tienda": "Luchito Licores",
#      "total": "15000",
#      "id_usuario": "1",
#      "fecha": "2017-04-05",
#      "medio_pago": "Efectivo"
#    },
#    {
#      "id_pedido": "2",
#      "tienda": "Luchito Licores",
#      "total": "15000",
#      "id_usuario": "1",
#      "fecha": "2017-04-07",
#      "medio_pago": "Débito"
#    }
#  ]
# }

# http://138.197.40.153/apiKrt/login.php?mail=asd@asd.com&pass=Prueba1}
# {
#  "status": 1,
#  "nombre": "Prueba"
# }

  namespace :api do
    resources :order, path: 'pedidos' do
      get 'index'
    end

    resources :user, path: 'login' do
      get 'index'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
