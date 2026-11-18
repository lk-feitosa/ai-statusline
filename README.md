# ai-statusline

Configuração pessoal da barra de status (Status Line) para **Antigravity CLI** e **Claude Code**, com exibição de modelo ativo, nível de raciocínio, barras de cota restante (5h e semanal), tempo até o reset, pasta atual e estado do agente.

## Estrutura

```text
ai-statusline/
├── bin/
│   ├── ai-statusline.cjs         # Renderizador da barra de status (Node.js)
│   └── ai-quota-fetcher.cjs      # Coletor em segundo plano de cotas (live_quota.json)
├── configs/
│   ├── claude-settings.json      # Trecho para ~/.claude/settings.json
│   ├── antigravity-settings.json # Trecho para ~/.gemini/antigravity-cli/settings.json
│   └── tmux.conf                 # Configuração opcional de ~/.tmux.conf
├── instalar.ps1                  # Instalador rápido para Windows
└── instalar.sh                   # Instalador rápido para Linux / macOS
```

---

## Instalação Rápida em Outro PC

Pré-requisito: **Node.js** instalado no sistema.

### Windows (PowerShell)

```powershell
git clone https://github.com/lk-feitosa/ai-statusline.git
cd ai-statusline
.\instalar.ps1
```

### Linux / macOS

```bash
git clone https://github.com/lk-feitosa/ai-statusline.git
cd ai-statusline
chmod +x instalar.sh && ./instalar.sh
```

---

## Instalação Manual (Copiar e Colar)

1. Copie `bin/ai-statusline.cjs` e `bin/ai-quota-fetcher.cjs` para `~/.local/bin/`:
   - **Windows:** `C:\Users\<SEU_USUARIO>\.local\bin\`
   - **Linux/macOS:** `~/.local/bin/`

2. Adicione o bloco `statusLine` nas configurações de cada CLI:

### Claude Code (`~/.claude/settings.json`)

```json
{
  "statusLine": {
    "type": "command",
    "command": "node C:/Users/<SEU_USUARIO>/.local/bin/ai-statusline.cjs claude"
  }
}
```
*(No Linux/macOS, troque pelo caminho `/home/<SEU_USUARIO>/.local/bin/ai-statusline.cjs claude`.)*

### Antigravity CLI (`~/.gemini/antigravity-cli/settings.json`)

```json
{
  "statusLine": {
    "type": "command",
    "command": "node C:/Users/<SEU_USUARIO>/.local/bin/ai-statusline.cjs agy",
    "enabled": true
  }
}
```

### Tmux (Opcional — `~/.tmux.conf`)

Copie `configs/tmux.conf` para `~/.tmux.conf` caso utilize o `tmux` com agentes no terminal.
