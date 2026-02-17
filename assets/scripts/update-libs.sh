#!/usr/bin/env bash
# Script para atualizar as libs do projeto MusicFlix
# Faz download das versões estáveis de jQuery e Owl Carousel (JS + CSS)
# Substitui os arquivos em assets/js/owl e assets/css/owl, fazendo backup.

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
TARGET_JS_DIR="$ROOT_DIR/assets/js/owl"
TARGET_CSS_DIR="$ROOT_DIR/assets/css/owl"
BACKUP_DIR="$ROOT_DIR/assets/.libs_backups/$(date +%Y%m%d_%H%M%S)"

# Versões desejadas (altere se quiser outra versão)
JQUERY_URL="https://code.jquery.com/jquery-3.6.0.min.js"
OWL_JS_URL="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
OWL_CSS_URL="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
OWL_THEME_CSS_URL="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"

# Arquivos de destino
JQUERY_TARGET="$TARGET_JS_DIR/jquery.min.js"
OWL_JS_TARGET="$TARGET_JS_DIR/owl.carousel.min.js"
OWL_CSS_TARGET="$TARGET_CSS_DIR/owl.carousel.min.css"
OWL_THEME_CSS_TARGET="$TARGET_CSS_DIR/owl.theme.default.min.css"

echo "Diretório do projeto: $ROOT_DIR"
echo "Criando diretório de backup em: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
mkdir -p "$TARGET_JS_DIR"
mkdir -p "$TARGET_CSS_DIR"

backup_if_exists() {
  local file="$1"
  if [ -f "$file" ]; then
    echo "Fazendo backup de $file"
    mkdir -p "$(dirname "$BACKUP_DIR/$file")"
    cp -a "$file" "$BACKUP_DIR/$file"
  fi
}

download() {
  local url="$1"
  local dest="$2"
  echo "Baixando $url -> $dest"
  if command -v curl >/dev/null 2>&1; then
    curl -L --fail --silent --show-error "$url" -o "$dest"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$dest" "$url"
  else
    echo "Erro: nem curl nem wget estão disponíveis. Instale um dos dois e execute novamente."
    exit 2
  fi
}

# Backup dos arquivos atuais (se existirem)
backup_if_exists "$JQUERY_TARGET"
backup_if_exists "$OWL_JS_TARGET"
backup_if_exists "$OWL_CSS_TARGET"
backup_if_exists "$OWL_THEME_CSS_TARGET"

# Download dos arquivos novos
download "$JQUERY_URL" "$JQUERY_TARGET"
download "$OWL_JS_URL" "$OWL_JS_TARGET"
download "$OWL_CSS_URL" "$OWL_CSS_TARGET"
download "$OWL_THEME_CSS_URL" "$OWL_THEME_CSS_TARGET"

# Saída de verificação
echo ""
echo "Arquivos atualizados:"
ls -l "$JQUERY_TARGET" "$OWL_JS_TARGET" "$OWL_CSS_TARGET" "$OWL_THEME_CSS_TARGET" || true

echo ""
echo "Backups salvos em: $BACKUP_DIR"
echo "Pronto. Verifique manualmente a aplicação se quiser (ex: abrir index.html no navegador)."
echo "Se quiser reverter, copie os arquivos do diretório de backup de volta para os locais originais."