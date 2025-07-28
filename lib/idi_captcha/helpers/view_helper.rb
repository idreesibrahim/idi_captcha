module IdiCaptcha
  module Helpers
    def captcha_tag
      image_tag('/idi_captcha/captcha?' + Time.now.to_i.to_s, alt: 'CAPTCHA')
    end
  end
end

ActionView::Base.include IdiCaptcha::Helpers

