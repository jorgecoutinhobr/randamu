# randamu

  [![Gem Version](https://badge.fury.io/rb/randamu.svg)](https://badge.fury.io/rb/randamu)

## Aviso

Ainda está em desenvolvimento.

## Objetivo

Esta biblioteca foi desenvolvida como um projeto de aprendizado para entender o desenvolvimento e publicação de libs. Seu objetivo principal é fornecer um conjunto de ferramentas para geração de dados aleatórios em português, facilitando a criação de objetos de teste.

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

### Exemplos de Uso

```ruby
require 'randamu'

animal = Randamu::Animal.animal()

mamifero = Randamu::Animal.animal(type: :mammal)

frase= Randamu::Text.phrase(length: 4)

paragrafo = Randamu::Text.paragraph(phrases: 4)

texto = Randamu::Text.big_text(paragraphs: 4)

nome = Randamu::Name.first_name()

sobrenome = Randamu::Name.last_name()

nome_completo = Randamu::Name.full_name()

nome_customizado = Randamu::Name.custom_name(length: 3, gender: :male)
```



