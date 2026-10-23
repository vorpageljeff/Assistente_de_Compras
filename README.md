# Assistente de Compras

Aplicativo Flutter de assistência de compras com integração a modelos de linguagem para recomendações de produtos.

## Tecnologias

- Flutter e Dart
- Google Generative AI (`google_generative_ai`)
- Cliente HTTP (`http`)

## Desenvolvimento

Com o Flutter instalado, execute na raiz do projeto:

```bash
flutter pub get
flutter run
```

Consulte `pubspec.yaml` para as versões e restrições das dependências. A configuração de credenciais da integração deve ser verificada no código antes da execução.

## Verificação

```bash
flutter analyze
flutter test
```

## Organização

Este repositório reúne o projeto `assistente_compras_gemini`. A documentação foi organizada em 23/10/2026; os comandos acima são instruções de desenvolvimento e não representam testes executados nesta revisão.

## Configuração da chave

A chave não fica mais gravada no fonte. Para uso local, configure `GEMINI_API_KEY` com `--dart-define` na execução do Flutter, mantendo o valor fora do Git. Esse valor pode ser extraído de um aplicativo compilado; para distribuição pública, use uma API de backend que guarde a credencial.

Uma chave estava presente no histórico anterior. Removê-la do fonte atual não revoga a credencial: o titular precisa revogá-la no provedor antes de considerar a exposição resolvida.
