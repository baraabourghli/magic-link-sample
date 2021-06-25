Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "home#index"
  post '/sendmagiclink', to: "home#send_magic_link"
  get '/authenticate', to: "home#authenticate"
end
