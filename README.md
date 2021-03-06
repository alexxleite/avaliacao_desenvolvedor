Instruções de Instalação:

# App read only files .csv (for .txt need implementation)

# Ruby version : 
	- Ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]
	- Rails 4.2.4
	-	RubyGems version	2.4.8
	-	Rack version	1.6.4
	-	JavaScript Runtime	Node.js (V8)

# System dependencies
	- customer.CSV file

# Configuration
	- database: sqlite3 (default)
	- database: db/development.sqlite3
	- database: db/test.sqlite3
	- database: db/production.sqlite3

# How to run the test suite
	- Open app:
		http://localhost:3000/vendas
	- Calculs:
		http://localhost:3000/receita

# Deployment instructions
	- https://github.com/alexxleite/avaliacao_desenvolvedor



# Middleware	

    Rack::Sendfile
    ActionDispatch::Static
    Rack::Lock
    #<ActiveSupport::Cache::Strategy::LocalCache::Middleware:0x00000003e08c30>
    Rack::Runtime
    Rack::MethodOverride
    ActionDispatch::RequestId
    Rails::Rack::Logger
    ActionDispatch::ShowExceptions
    WebConsole::Middleware
    ActionDispatch::DebugExceptions
    ActionDispatch::RemoteIp
    ActionDispatch::Reloader
    ActionDispatch::Callbacks
    ActiveRecord::Migration::CheckPending
    ActiveRecord::ConnectionAdapters::ConnectionManagement
    ActiveRecord::QueryCache
    ActionDispatch::Cookies
    ActionDispatch::Session::CookieStore
    ActionDispatch::Flash
    ActionDispatch::ParamsParser
    Rack::Head
    Rack::ConditionalGet
    Rack::ETag



# Desafio de programação 1
A idéia deste desafio é nos permitir avaliar melhor as habilidades de candidatos à vagas de programador, de vários níveis.

Este desafio deve ser feito por você em sua casa. Gaste o tempo que você quiser, porém normalmente você não deve precisar de mais do que algumas horas.

## Instruções de entrega do desafio
1. Primeiro, faça um fork deste projeto para sua conta no Github (crie uma se você não possuir).
2. Em seguida, implemente o projeto tal qual descrito abaixo, em seu próprio fork.
3. Crie as instruções de instalação e execução do aplicativo em seu readme.md
4. Por fim, envie o link do seu repositorio para avaliarmos seu código


## Descrição do projeto
Você recebeu um arquivo de texto com os dados de vendas da empresa. Precisamos criar uma maneira para que estes dados sejam importados para um banco de dados.

Sua tarefa é criar uma interface web que aceite upload de arquivos, normalize os dados e armazene-os no banco de dados.

Sua aplicação web DEVE:

1. Aceitar (via um formulário) o upload de arquivos text, com dados separados por TAB testar o aplicativo usando o arquivo fornecido. A primeira linha do arquivo tem o nome das colunas. Você pode assumir que as colunas estarão sempre nesta ordem, e que sempre haverá uma linha de cabeçalho. Um arquivo de exemplo chamado 'dados.txt' está incluído neste repositório.
2. Interpretar ("parsear") o arquivo recebido, normalizar os dados, e salvar corretamente a informação em um banco de dados relacional.
3. Exibir todos os registros importados, bem como a receita bruta total dos registros contidos no arquivo enviado após o upload + parser.
4. Ser escrita obrigatoriamente em Ruby 2.1+ Rails 4 e SQLite
5. Ser simples de configurar e rodar a partir das instruções fornecidas, funcionando em ambiente compatível com Unix (Linux ou Mac OS X). Ela deve utilizar apenas linguagens e bibliotecas livres ou gratuitas.
6. Ter um teste de model e controller automatizado para a funcionalidade pedida
7. Ter uma boa aparecia e ser fácil de usar

## Avaliação
Seu projeto será avaliado de acordo com os seguintes critérios. 

1. Sua aplicação atende funcionalmente o que foi pedido
2. Você documentou a maneira de configurar o ambiente e rodar sua aplicação na maquina do avaliador
3. Você seguiu as instruções enviadas
4. Voce segue as boas práticas de programação e entrega para o Cliente
5. O código escrito é facil de entender e manter
6. Você se preocupa com o uso do aplicativo pelo Usuário

Adicionalmente, tentaremos verificar a sua familiarização com as bibliotecas padrões (standard libs), bem como sua experiência com programação orientada a objetos a partir da estrutura de seu projeto, preucupação com o objetivo da aplicação e do seu uso pelo usuário, suporte e manutenção do código por outros desenvolvdores

### Referência

Este desafio foi baseado neste outro desafio: https://github.com/lschallenges/data-engineering

