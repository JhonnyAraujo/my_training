# ⚡ My Training

> **My Training** é um projeto pessoal com objetivo que se torne fácil e prático o gerenciamento de seus treinos em casa.

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.44.6-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-v3.12.2-blue.svg)](https://dart.dev/)

## ✨ Funcionalidades

- **Criar treino:** Formulario para criar o treino, com o nome do treino, intervalo, nome dos exercicios.
- **Visualização dos Treinos:** Lista de dos treinos criados com a possibilidade de excluir cada treino.

## 🧠 Decisões de Desenvolvimento

Neste projeto, apliquei uma abordagem sistemática para garantir que o código fosse modular, testável e fácil de manter. Abaixo estão as principais decisões de design:

- **MVVM:** Eu escolhi essa arquitetura por ter mais dominio com ela, por ser a recomendada pela equipe flutter e separa as responsabidade da lógica de négocio e UI.

- **GetX:** Eu implementei o pacote GetX pela sua versatilidade com a possibilidade de trabalhar com ele atuado como gerenciador de estado, injeção de dependencia e rotas nomeadas.

- **Shared Preferences:** Eu implementei essa persistência de dados pela sua simplicidade de trabalhar com ela.

## 🛠️ Tecnologias e Arquitetura

Este projeto foi desenvolvido com as seguintes tecnologias e práticas:

- **Linguagem:** [Dart](https://dart.dev/)
- **Framework:** [Flutter](https://flutter.dev/)
- **Gerenciamento de Estado:** [GetX](https://pub.dev/packages/get)
- **Persistência de Dados:** [Shared Praferences](https://pub.dev/packages/shared_preferences)
- **Arquitetura:** MVVM

## 🧪 Cobertura de Testes

O projeto conta com suítes de testes automatizados para garantir a estabilidade das regras de negócio e da interface:

* **Testes Unitários:** Validação de regras de negócio, conversão de dados e gerenciamento de estado.
* **Testes de Widget / UI:** Garantia de renderização correta dos componentes e reação aos estados da tela.
* **Testes de Integração:** Fluxos ponta a ponta simulando a navegação e interação do usuário real.

#### Como executar os testes

```bash
flutter test
```


## 🚀 Como Executar o Projeto

**Pré-requisitos**

Certifique-se de ter instalado em sua máquina:

- [Git](https://git-scm.com)
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Um emulador (Android/iOS) ou dispositivo físico devidamente configurado.

**Passo a passo**

1. Faça o clone deste repositório:

```bash
git clone https://github.com/JhonnyAraujo/app-rick-and-morty.git
```

2. Acesse o diretório do projeto:

```bash
cd nome-do-repositorio
```

3. Instale as dependências do pacote:

```bash
flutter pub get
```

4. Gere os arquivos de estado do MobX (`.g.dart`):

```bash
dart run build_runner build --delete-conflicting-outputs
```

5. Execute o aplicativo:

```bash
flutter run
```
