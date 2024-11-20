# randamu

  [![Gem Version](https://badge.fury.io/rb/randamu.svg)](https://badge.fury.io/rb/randamu)

## Objetivo

Esta gem foi desenvolvida como um projeto de aprendizado para entender o desenvolvimento e publicação de uma gem. Seu objetivo principal é fornecer um conjunto de ferramentas para geração de dados aleatórios em português, facilitando a criação de objetos de teste.

## Como Usar

### Instalação

Adicione esta linha ao seu Gemfile:

```ruby
gem 'randamu'
```

E então execute:

```sh
bundle install
```

Ou instale você mesmo:

```sh
gem install randamu
```

### Exemplos

```ruby
require 'randamu'

# Gerar um CPF válido
cpf_valido = Randamu::Doc.cpf
# "45030542019"

# Gerar um CPF inválido
cpf_invalido = Randamu::Doc.cpf(valid: false)
# "45030542015"

orgao_emissor = Randamu::Doc.issuing_authority
# "DETRAN"

orgao_emissor = Randamu::Doc.issuing_authority(full_name: true)
# "DETRAN - Departamento Estadual de Trânsito"
```


<details>
  <summary>Randamu::Academic</summary>

```ruby
# Gerar um nível de escolaridade
Randamu::Academic.education_level
# saida: "Superior"

# Gerar um curso acadêmico aleatório
Randamu::Academic.course
# saida: "Engenharia de Software"

# Gerar uma escola aleatória
Randamu::Academic.school
# saida: "Colégio Pedro II"

# Gerar uma universidade aleatória
Randamu::Academic.university
# saida: "Universidade Federal Fluminense"

# Usar o alias `college` para gerar uma universidade
Randamu::Academic.college
# saida: "Universidade Federal Fluminense"
```
</details>

<details>
  <summary>Randamu::Account</summary>

```ruby
# Gerar um username aleatório
# Por padrao: username(type: :default)
# Parâmetros permitidos: :default, :funny
Randamu::Account.username
# Saída: "Coyote"
Randamu::Account.username(type: :funny)
# Saída: "CarimboMiguel"

# Gerar um email aleatório
Randamu::Account.email
# Saída: "joao_silva@gmail.com"

# Gerar uma senha aleatória
# Por padrão: password(length: 8, special: true, numeric: true, alphabet: true)
Randamu::Account.password
# Saída: "A1#2c3_4"

# Gerar um telefone aleatório
# # Por padrão: 
#       phone(state: :'ACRONIMO_DE_UM_ESTADO_ALEATORIO', country_code: false)
#       phone_only_numbers(state: :'ACRONIMO_DE_UM_ESTADO_ALEATORIO', country_code: false)
Randamu::Account.phone(state: :rj, country_code: true)
# Saída: "+55 (21) 999999999"
Randamu::Account.phone_only_numbers(state: :rj, country_code: true)
# Saída: "5521999999999"
```
</details>

<details>
  <summary>Randamu::Animal</summary>

```ruby
# Gerar um animal aleatório
# Por padrao: animal(type: nil)
# Parâmetros permitidos: :mammal :bird :fish :amphibian :reptile :insect
Randamu::Animal.animal
# Saída: "Gato"
Randamu::Animal.animal(type: :bird)
# Saída: "Coruja"
```
</details>

<details>
  <summary>Randamu::Boolean</summary>

```ruby
# Gerar um booleano aleatório
Randamu::Boolean.boolean
# Saída: true
```
</details>

<details>
  <summary>Randamu::Business</summary>

```ruby
# Gerar um nome de empresa aleatório
Randamu::Business.company_name

# Gerar um tipo de assinatura aleatório
Randamu::Business.subscription
# Saída: "Mensal"
```
</details>

<details>
  <summary>Randamu::Date</summary>

```ruby
# Gerar uma data aleatória
# Por padrão: date(start_date: '01/01/1950', end_date: 'Date.today.to_s', as_string: false)
# Parâmetros start_date e end_date devem ser strings no formato 'dd/mm/yyyy'
d = Randamu::Date.date
#<Date: 1983-01-03 ((2445338j,0s,0n),+0s,2299161j)>
d.class # Date

Randamu::Date.date(as_string: true)
# Saída: "03/01/1983"

# Gerar uma data futura
# Por padrão: future_date(start_date: 'Date.today.to_s', end_date: '31/12/2050', as_string: false)
d = Randamu::Date.future_date
#<Date: 2037-07-06 ((2459470j,0s,0n),+0s,2299161j)>
d.class # Date

Randamu::Date.future_date(as_string: true)
# Saída: "06/07/2037"

Randamu::Date.day_of_week
# Saída: "Segunda"

Randamu::Date.month
# Saída: "Janeiro"

```
</details>

<details>
  <summary>Randamu::Doc</summary>

```ruby
# Gerar um CPF aleatório
# Por padrão: cpf(valid: true)
Randamu::Doc.cpf
# Saída: "12345678909"
Randamu::Doc.cpf(valid: false)
# Saída: "12345678900"

# Gerar um CNPJ aleatório
# Por padrão: cnpj(valid: true)
Randamu::Doc.cnpj
# Saída: "12345678000109"
Randamu::Doc.cnpj(valid: false)
# Saída: "12345678000100"

# Gerar um RG aleatório
Randamu::Doc.rg
# Saída: "123456789"

# Gerar um título de eleitor aleatório
Randamu::Doc.voter_registration
# Saída: "123456789012"

# Gerar CNH aleatório
Randamu::Doc.cnh 
# Saída: "123456789"

# Gerar orgao emissor aleatório
# Por padrão: issuing_authority(full_name: false)
Randamu::Doc.issuing_authority
# Saída: "DETRAN"
Randamu::Doc.issuing_authority(full_name: true)
# Saída: "DETRAN - Departamento Estadual de Trânsito"
```
</details>

<details>
  <summary>Randamu::Map</summary>

```ruby
# Gerar um endereco completo aleatório
# Por padrão: full_address(state: nil)
Randamu::Map.full_address
# Saída: "Rua dos Lobos, 105, Campinas, Minas Gerais, 20000-000"

Randamu::Map.full_address(state: :sp)
# Saída: "Rua dos Lobos, 105, Campinas, São Paulo, 20000-100"

# Gerar uma cidade aleatória
# Por padrão: city(state: nil)
# Parâmetros permitidos: :sigla_de_um_estado_como_symbol
Randamu::Map.city
# Saída: "Rio de Janeiro"
Randamu::Map.city(state: :sp)
# Saída: "Campinas"

# Gerar um estado aleatório
# Por padrão: state(region: nil, acronym: false)
# Parâmetros permitidos: region: :regiao_brasielira_como_symbol
Randamu::Map.state
# Saída: "Rio de Janeiro"
Randamu::Map.state(region: :nordeste)
# Saída: "Bahia"
Randamu::Map.state(region: :nordeste, acronym: true)
# Saída: "BA"

# Gerar um país aleatório
Randamu::Map.country
# Saída: "Brasil"

# Gerar um CEP aleatório
Randamu::Map.zip_code
# Saída: "20000-000"

# Gerar complemento de endereço aleatório
Randamu::Map.additional_address_data
# Saída: "Prox. a Câmara Municipal"
```
</details>

<details>
  <summary>Randamu::Person</summary>

```ruby
# Gerar um nome aleatório
# Por padrão first_name(gender: nil)
# Parâmetros permitidos: :male, :female
Randamu::Person.first_name
# Saída: "João"
Randamu::Person.first_name(gender: :female)
# Saída: "Maria"

# Gerar um sobrenome aleatório
Randamu::Person.last_name
# Saída: "Silva"

# Gerar um nome completo aleatório
# Por padrão full_name(gender: nil, length: 2)
# Parâmetros permitidos: :male, :female
Randamu::Person.full_name
# saída: "João Silva"
Randamu::Person.full_name(gender: :male, length: 3)
# Saída: "João Costa Pinheiro"

# Gerar um gênero aleatório
Randamu::Person.gender
# Saída: "Masculino"

# Gerar um estado civil aleatório
Randamu::Person.marital_status
# Saída: "Solteiro"

# Gerar profissão aleatória
Randamu::Person.profession
# Saída: "Médico"

# Gerar tipo sanguíneo aleatório
Randamu::Person.blood_type
# Saída: "O+"

# Gerar religiao aleatoria
# Por padrão religion(adjective: true)
Randamu::Person.religion
# Saída: Judeu

Randamu::Person.religion(adjective: false)
# Saída: Judaísmo
```
</details>

<details>
  <summary>Randamu::Text</summary>

```ruby
# Gerar uma palavra aleatória
# Por padrão: word(format: nil)
# Parâmetros permitidos: :capitalize, :upcase, :downcase
Randamu::Text.word
# Saída: "lorem"

# Gerar um titulo aleatório
# Por padrão: title(words: 3)
Randamu::Text.title
# Saída: "Lorem Ipsum Dolor"

# Gerar uma frase aleatória
# Por padrão: phrase(words: 4)
Randamu::Text.phrase
# Saída: "Lorem ipsum dolor sit amet."

# Gerar um parágrafo aleatório
# Por padrão: paragraph(phrases: 8)
Randamu::Text.paragraph

# Gerar um texto aleatório
# Por padrão: text(paragraphs: 4)
Randamu::Text.text
```
</details>

