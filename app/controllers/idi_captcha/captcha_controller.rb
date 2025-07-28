module IdiCaptcha
  class CaptchaController < ActionController::Base
    def show
      send_data IdiCaptcha::Captcha.generate(session), type: 'image/png', disposition: 'inline'
    end
  end
end
