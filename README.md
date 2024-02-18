# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

### Keyboard Shortcuts Overview

#### Basic Editing:

- **Open Documentation String**: `shift + k` in normal mode over a function to view the doc string.
- **Undo**: `ctrl + z`
- **Redo**: `ctrl + shift + z`
- **Cut Lines**: `ctrl + x`
- **Copy**: `ctrl + c`
- **Paste**: `ctrl + v`

#### Line and Text Manipulation:

- **Indent Line**: `Tab`
- **Unindent Line**: `ctrl + d`
- **Create Line at Top**: `ctrl + m` or `ctrl + shift + m`
- **Create Line at Bottom**: `ctrl + n` or `ctrl + shift + n`
- **Move Lines Up**: `alt + arrow up` or `<A-Up>`
- **Move Lines Down**: `alt + arrow down` or `<A-Down>`
- **Disable Continuations**: Using `<Leader>o` and `<Leader>O` in normal mode.

#### Tabs and Windows:

- **New Tab**: `te` for new tab, `<tab>` for next tab, `<s-tab>` for previous tab.
- **Split Window**: `ss` for horizontal split, `sv` for vertical split.
- **Move Window**: Use `sh`, `sk`, `sj`, `sl` to move the window in respective directions.
- **Tabs Navigation**:
  - Left: `shift + h`
  - Right: `shift + l`

#### Advanced Commands:

- **Telescope Commands**:
  - Find Files: `<leader>ff`
  - Live Grep: `<leader>fg`
  - Buffers: `<leader>fb`
  - Help Tags: `<leader>fh`
- **Markdown Visualizer**:
  - Open: `ctrl + mp` or `<leader>mp`
  - Close: `ctrl + ms` or `<leader>ms`
  - Toggle: `ctrl + mt` or `<leader>mt`

#### Screen Navigation:

- Left: `shift + h`
- Right: `shift + l`
- Up: `shift + j`
- Down: `shift + k`

### Troubleshooting:

For setting up language servers and other tools, follow these commands:

- **Lazy Nvim**:
  ```
  :TSInstall css typescript tsx
  :TSInstall astro
  ```
- **Prettier**:
  ```
  npm install --save-dev prettier
  ```
- **Astro Language Server**:
  ```
  npm install -g astro-language-server
  npm install --save-dev prettier-plugin-astro
  npm install --save-dev github:username/prettier-plugin-astro
  ```
- **Svelte Language Server**:
  ```
  npm install -g svelte-language-server
  ```
