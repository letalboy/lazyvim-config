# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

### Keyboard Shortcuts Overview

#### Documentation Viewing:

- Press `Shift + K` in normal mode over a function to view its documentation.

#### Editing Lines:

- **Indent Line**: Press `Tab`.
- **Unindent Line**: Press `Ctrl + D`.
- **Insert Line**:
  - At the top: Press `Ctrl + M`.
  - At the bottom: Press `Ctrl + N`.
- **Move Line**:
  - Up: Press `Alt + Up Arrow`.
  - Down: Press `Alt + Down Arrow`.
- **Cut Line**: Press `Ctrl + X`.
- **Copy**: Press `Ctrl + C`.
- **Paste**: Press `Ctrl + V`.

#### Undo and Redo:

- **Undo**: Press `Ctrl + Z`.
- **Redo**: Press `Ctrl + Shift + Z`.

#### Navigating Tabs:

- **Navigate Left**: In normal mode, press `Shift + H`.
- **Navigate Right**: In normal mode, press `Shift + L`.

#### Markdown Visualizer:

- **Open**: Press `Ctrl + MP`.
- **Close**: Press `Ctrl + MS`.
- **Toggle**: Press `Ctrl + MT`.

#### Window Navigation:

- **Navigate Left**: Press `Shift + H`.
- **Navigate Right**: Press `Shift + L`.
- **Navigate Up**: Press `Shift + J`.
- **Navigate Down**: Press `Shift + K`.

### Troubleshooting

#### Required Language Servers:

For this setup, ensure you have necessary language servers installed. Use the following commands:

- For Lazy Nvim:
  - `:TSInstall css typescript tsx`
  - `:TSInstall astro`

#### Installing Prettier:

- Run `npm install --save-dev prettier`.

#### Installing Astro Language Server:

- Run `npm install -g astro-language-server`.
- Run `npm install --save-dev prettier-plugin-astro`.
- For GitHub hosted plugins, use `npm install --save-dev github:username/prettier-plugin-astro`.

#### Installing Svelte Language Server:

- Run `npm install -g svelte-language-server`.
