module IdiCaptcha
  class Engine < ::Rails::Engine
    isolate_namespace IdiCaptcha

    initializer "idi_captcha.helpers" do
      ActiveSupport.on_load(:action_view) do
        include IdiCaptcha::Helpers::ViewHelper
      end
    end
  end
end
