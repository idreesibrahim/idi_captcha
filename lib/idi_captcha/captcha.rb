module IdiCaptcha
  class Captcha
    def self.generate(session)
      a = rand(1..9)
      b = rand(1..9)
      session[:captcha_question] = "#{a} + #{b}"
      session[:captcha_answer] = a + b
    end

    def self.valid?(session, input)
      session[:captcha_answer].to_i == input.to_i
    end
  end
end
