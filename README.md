# KambaCheckout

Gem ruby para configurar o checkout nos serviços da Kamba.
## Instalação

Adicione essa linha ao Gemfile da sua applicação:

```ruby
gem 'kamba_checkout'
```

E execute:

    $ bundle

ou instale por você mesmo:

    $ gem install kamba_checkout

## Configuração

```ruby
require 'kamba_checkout'

KambaCheckout.api_key = 'sua-chave-da-api-kamba'
KambaCheckout.secret_key = 'sua-chave-secreta-kamba'
```

Ou simplesmente atribua os valores das suas chaves as seguintes variáveis de ambiente: `ENV["KAMBA_API_KEY"]` e `ENV["KAMBA_SECRET_KEY"]`.

Usando Ruby on Rails? Coloque isso em config/initializers em novo arquivo chamado kamba_checkout.rb.

## Uso

```ruby
checkout_config = {
            "channel"=>"WEB",
            "initial_amount"=>10000,
            "notes"=> "Curso API Iniciantes",
            "redirect_url_success"=>"https://seusite.com/curso/api-iniciantes"
      }
@checkout = KambaCheckout::API.generate_checkout('KAMBA-API-MODE', checkout_config)
```
Obs: `KAMBA-API-MODE: sandbox, staging ou production`


**Configurações `checkout_config`:**
- Para o nosso propósito o valor do campo `channel`, permanecerá igual à **WEB** como no exemplo.
- `initial_amount`, este campo recebe o preço do produto ou serviço a ser comercializado.
- Substitua o valor do campo `notes` por uma anotação ou descrição geral a cerca do pagamento, e coloque o preço do mesmo no valor do campo `initial_amount`.
- O campo `redirect_url_success` recebe o endereço da página na qual pretende-se ser redirecionada após o pagamento com sucesso.

## Usando Ruby on Rails?

Coloque o código acima na action que renderiza a página que vai conter o checkout e siga as instruções:

**Passo 1:**
## Página do comerciante
Faça a chamada à biblioteca no cabeçalho da sua página Web ou no corpo da página antes das outras configurações javascript que poderão ser configuradas:

```html
<head>       
  <script src="http://comerciante.usekamba.com/checkout/0.0.1/kamba-web-sdk.js" charset="utf-8"></script>
</head>
```

**Passo 2:**
Faça a inclusão do botão "Pagar com KAMBA" dentro do corpo da sua página Web em qualquer lugar onde desejar que o botão seja apresentado.

```html
<body>
  <button class="btnOpenWidgetKamba" onclick="start_payment()"></button>
</body>
```

**Passo 3:**
Cole o código abaixo dentro da tag html `<body></body>` no corpo da sua página Web, de preferência no final da página.

```html
<body>
   <script type="text/javascript">
    function start_payment() {
      kamba(api_config = {
    	  environment: '<%= @checkout.environment %>', // Use variável de ambiente para segurança.
    	  api_key: '<%= @checkout.api_key %>', // Use variável de ambiente para segurança.
        checkout_time: '<%= @checkout.time %>',
        checkout_signature: '<%= @checkout.signature %>'
    	},
    	checkout_config = {
        channel: '<%= @checkout.channel %>',
        initial_amount: <%= @checkout.initial_amount %>,
        notes: '<%= @checkout.notes %>',
        redirect_url_success: '<%= @checkout.redirect_url_success %>'
     });
    }
  </script>
  </script>
</body>
