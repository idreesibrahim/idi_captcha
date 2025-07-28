# idi_captcha

Offline CAPTCHA for Rails 6+ applications that works without any external service. Fully compatible with Devise and designed for restricted or offline environments.

## 🔧 Installation

Add this line to your application's **Gemfile**:

```ruby
gem 'idi_captcha', path: 'relative/path/to/idi_captcha'
```

Then execute:

```bash
bundle install
```

Mount the engine in your `config/routes.rb`:

```ruby
mount IdiCaptcha::Engine => "/idi_captcha"
```

## 🚀 Features

- Offline image CAPTCHA (no Google reCAPTCHA)
- Compatible with Rails 6+
- Session-based validation
- Easy to use with Devise
- Image served via internal engine controller

## 🧩 Usage

### 1. Show CAPTCHA in your form

For example, in `devise/sessions/new.html.erb`:

```erb
 <div class="form-group">
  <label for="captcha" class="font-weight-bold text-primary">🧠 CAPTCHA Verification</label>
  <div class="input-group mt-2">
      <div class="input-group-prepend">
      <span class="input-group-text bg-light font-weight-bold">What is <%= session[:captcha_question] || "?" %> ?</span>
      </div>
      <%= text_field_tag :captcha, nil, class: "form-control", placeholder: "Enter your answer", required: true, autocomplete: "off" %>
  </div>
</div>

```

### 2. Validate CAPTCHA in your controller

Override Devise's sessions controller:
```ruby
class Users::SessionsController < Devise::SessionsController
  def new
    IdiCaptcha::Captcha.generate(session)
    super
  end
  def create
    unless IdiCaptcha::Captcha.valid?(session, params[:captcha])
      flash.now[:alert] = "Invalid CAPTCHA"
      self.resource = resource_class.new(sign_in_params)
      IdiCaptcha::Captcha.generate(session) ## Regenerate captcha
      respond_with_navigational(resource) { render :new }
      return
    end

    super do
      session[:modal_shown] = true
    end
  end
end
```

Update routes:

```ruby
devise_for :users, controllers: {
  sessions: 'users/sessions'
}
```

## 📂 Gem Structure

```text
idi_captcha/
├── lib/
│   ├── idi_captcha.rb
│   ├── idi_captcha/
│   │   ├── captcha.rb
│   │   ├── engine.rb
│   │   └── helpers/
│   │       └── view_helper.rb
```

## ✅ Requirements

- Ruby >= 2.3
- Rails >= 6.0

## 🧪 Testing Locally

```bash
gem build idi_captcha.gemspec
bundle install
rails server
```

Access `http://localhost:3000/idi_captcha/captcha` to verify the CAPTCHA image loads.

## 👤 Author

**Idrees Ibrahim**  
📧 idrees.ibrahim@pitv.gov.pk  
🔗 [RubyGems.org](https://rubygems.org/gems/idi_captcha)

## 📝 License

This gem is licensed under a Nonstandard license.
