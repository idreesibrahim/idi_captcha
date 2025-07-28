require "mini_magick"
require "idi_captcha/version"
require "idi_captcha/engine"
require "idi_captcha/captcha"
require "idi_captcha/helpers/view_helper"

module IdiCaptcha
end

ActionView::Base.include IdiCaptcha::Helpers::ViewHelper
