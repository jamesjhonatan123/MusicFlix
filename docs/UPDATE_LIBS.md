# Atualização das bibliotecas do MusicFlix

Este documento descreve como atualizar as bibliotecas principais usadas pelo projeto (jQuery e Owl Carousel)
de forma segura usando o script fornecido.

## O que o script faz
- Faz backup (cópia) dos arquivos existentes em `assets/js/owl` e `assets/css/owl` para `assets/.libs_backups/<timestamp>/`.
- Baixa as versões especificadas de:
  - jQuery 3.6.0
  - Owl Carousel 2.3.4 (JS + CSS)
- Substitui os arquivos locais por essas versões.

## Arquivos atualizados
- assets/js/owl/jquery.min.js            <- jQuery
- assets/js/owl/owl.carousel.min.js      <- Owl Carousel JS
- assets/css/owl/owl.carousel.min.css    <- Owl Carousel CSS
- assets/css/owl/owl.theme.default.min.css <- Owl Carousel theme CSS

> Observação: as versões usadas são definidas no topo do script `assets/scripts/update-libs.sh`.
> Se quiser outra versão, edite as variáveis `JQUERY_URL`, `OWL_JS_URL`, `OWL_CSS_URL` e
> `OWL_THEME_CSS_URL` no script.

## Como executar
1. No diretório raiz do projeto, dê permissão de execução ao script (se necessário):
   ```bash
   chmod +x assets/scripts/update-libs.sh
   ```
2. Rode o script:
   ```bash
   ./assets/scripts/update-libs.sh
   ```
3. Verifique `assets/.libs_backups/` para ver os backups criados.
4. Abra `index.html` no navegador e verifique se tudo funciona como esperado.

## Reversão
Se algo der errado, recupere os arquivos a partir do backup: