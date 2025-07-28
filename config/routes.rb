IdiCaptcha::Engine.routes.draw do
  get 'captcha', to: 'captcha#show'
end