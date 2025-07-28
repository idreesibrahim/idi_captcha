module IdiCaptcha
  module Helpers
    module ViewHelper
      def captcha_tag
        if session[:captcha_question].present?
          "<label>What is #{session[:captcha_question]}?</label>".html_safe
        else
          "<label>CAPTCHA not set</label>".html_safe
        end
      end
    end
  end
end
