# tmux-config

Minha configuração do tmux: tema **Catppuccin Mocha** (sem plugins) e atalhos mais fáceis.

## Restaurar em uma máquina nova

```bash
git clone https://github.com/dionatansimioni/tmux-config.git ~/tmux-config
~/tmux-config/install.sh
```

O `install.sh` salva a `~/.tmux.conf` que já existir (`~/.tmux.conf.bak-DATA`) e cria um **link simbólico** para o `tmux.conf` deste repositório.

## Salvar alterações (backup)

Como `~/.tmux.conf` é um link para o repositório, editar a config já edita o arquivo do repo:

```bash
cd ~/tmux-config
git add -A && git commit -m "Ajusta config do tmux" && git push
```

## Atalhos

Prefixo = `Ctrl+b`

| Ação | Atalho |
|---|---|
| **Menu com todos os atalhos** | `Prefixo + m` |
| **Listar sessões disponíveis** | `Alt + s` ou `Prefixo + s` |
| Nova sessão com nome | `Prefixo + N` |
| Dividir lado a lado / embaixo | `Prefixo + \|` / `Prefixo + -` |
| Mudar de painel | `Alt + setas` |
| Mudar de janela | `Shift + ←/→` ou `Alt + 1..9` |
| Nova janela | `Prefixo + c` |
| Redimensionar painel | `Prefixo + H/J/K/L` (repetível) |
| Zoom no painel | `Prefixo + z` |
| Modo cópia (vi: `v` seleciona, `y` copia) | `Prefixo + [` |
| Recarregar config | `Prefixo + r` |

Também: mouse ativado, janelas começam em 1, painéis novos abrem na pasta atual.
O nome da sessão na barra fica **laranja** enquanto o prefixo está pressionado.

> Os títulos dos painéis usam um ícone que precisa de uma [Nerd Font](https://www.nerdfonts.com/) no terminal.
