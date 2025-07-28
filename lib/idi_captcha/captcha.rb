module IdiCaptcha
  class Captcha
    def self.generate(session)
      text = 5.times.map { ('A'..'Z').to_a.sample }.join
      session[:captcha_text] = text

      image = MiniMagick::Image.create("png") { |f| f.write " " }

      image.combine_options do |c|
        c.size "150x50"
        c.gravity "center"
        c.xc "white"
        c.fill "black"
        c.font "Helvetica"
        c.pointsize "32"
        c.draw "text 0,0 '#{text}'"
      end

      image.to_blob
    end

    def self.valid?(session, input)
      session[:captcha_text].to_s.upcase == input.to_s.upcase
    end
  end
end
