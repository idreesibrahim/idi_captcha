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
<%= captcha_tag %>

<div class="field">
  <%= label_tag :captcha, "Enter CAPTCHA" %>
  <%= text_field_tag :captcha, nil, required: true, autocomplete: "off" %>
</div>
```

### 2. Validate CAPTCHA in your controller

Override Devise's sessions controller:

```ruby
class Users::SessionsController < Devise::SessionsController
  def create
    unless IdiCaptcha::Captcha.valid?(session, params[:captcha])
      flash[:alert] = "Invalid CAPTCHA"
      redirect_to new_user_session_path and return
    end

    super
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
