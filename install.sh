#!/usr/bin/env bash
# Restaura a configuração do tmux deste repositório.
# Faz backup da ~/.tmux.conf atual e cria um link simbólico para o tmux.conf do repo,
# assim qualquer edição na config já fica dentro do repositório (é só dar commit/push).
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME/.tmux.conf"
SOURCE="$REPO_DIR/tmux.conf"

if ! command -v tmux >/dev/null 2>&1; then
  echo "⚠  tmux não está instalado. Instale com: sudo apt install tmux"
fi

if [ -L "$TARGET" ] && [ "$(readlink -f "$TARGET")" = "$SOURCE" ]; then
  echo "✓ ~/.tmux.conf já aponta para este repositório."
else
  if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    BACKUP="$TARGET.bak-$(date +%Y%m%d-%H%M%S)"
    mv "$TARGET" "$BACKUP"
    echo "• Config antiga salva em $BACKUP"
  fi
  ln -s "$SOURCE" "$TARGET"
  echo "✓ Link criado: $TARGET -> $SOURCE"
fi

# Recarrega se o tmux estiver rodando
if tmux info >/dev/null 2>&1; then
  tmux source-file "$TARGET" && echo "✓ Configuração recarregada no tmux em execução."
else
  echo "Abra o tmux para usar a nova configuração."
fi
