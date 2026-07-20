A starter template for [LazyVim](https://github.com/LazyVim/LazyVim). Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

### This build covers the following

- Python
- Rust
- Go
- JavaScript
- TypeScript
- HTML
- CSS
- Astro
- Svelte
- Markdown

### Theme

- Osaka Theme Setup To Acrilic Terminals

Here is how it looks:

![image](https://github.com/letalboy/lazyvim-config/assets/63066865/5b36cf21-08f3-403c-895f-84ebc25ea914)

The wallpaper in the background is not included, it is a wallpaper engine wallpaper just to demonstrate the transparency

## Auto Complete and Formatters

- prettier
- tree-sitter ("nvim-treesitter/nvim-treesitter")
- tree-sitter-astro ("virchau13/tree-sitter-astro")
- vim-svelte ("evanleck/vim-svelte")
- nvimformatter ("mhartington/formatter.nvim")

## It supports GIT

- GitSigns
- Other Git integrations, like last mod water marks, etc..

## Keyboard Shortcuts Overview

### **Basic Editing**

- **Open Documentation String**: `shift + k` in normal mode over a function to view the doc string.
- **Undo**: `ctrl + z`
- **Redo**: `ctrl + shift + z`
- **Cut Lines**: `ctrl + x`
- **Cut block**: `ctrl + x + c`
- **Copy**: `ctrl + c`
- **Copy Block**: `ctrl + c + b`
- **Paste**: `ctrl + v`

### **Line and Text Manipulation**

- **Indent Line**: `Tab`
- **Unindent Line**: `ctrl + d`
- **Create Line at Top**: `ctrl + m` or `ctrl + shift + m`
- **Create Line at Bottom**: `ctrl + n` or `ctrl + shift + n`
- **Move Lines Up**: `alt + arrow up` or `<A-Up>`
- **Move Lines Down**: `alt + arrow down` or `<A-Down>`
- **Disable Continuations**: Using `<Leader>o` and `<Leader>O` in normal mode.

### **Tabs and Windows**

- **New Tab**: `te` for new tab, `<tab>` for next tab, `<s-tab>` for previous tab.
- **Split Window**: `ss` for horizontal split, `sv` for vertical split.
- **Move Window**: Use `sh`, `sk`, `sj`, `sl` to move the window in respective directions.
- **Tabs Navigation**:
  - Left: `shift + h`
  - Right: `shift + l`

### **Advanced Commands**

##### **Telescope Commands**

- Find Files: `<leader>ff`
- Live Grep: `<leader>fg`
- Buffers: `<leader>fb`
- Help Tags: `<leader>fh`

##### **Markdown Visualizer**

- Open: `ctrl + mp` or `<leader>mp`
- Close: `ctrl + ms` or `<leader>ms`
- Toggle: `ctrl + mt` or `<leader>mt`

### **Screen Navigation**

- Left: `shift + h`
- Right: `shift + l`
- Up: `shift + j`
- Down: `shift + k`

## ➡️ **IMPORTANT!**

> To use it ensure that you have [nvim](https://neovim.io/) installed in your machine and [LazyVim](https://github.com/LazyVim/LazyVim) installed too,
> follow the instructions in each part correctly to ensure that the setup will work as intended.

## Installation and Setup Commands

To set up language servers, compilers, and other tools, follow these commands in sequence:

### 1. (Optional) **Windows Subsystem for Linux (WSL)**

```
wsl --install
```

### 2. **Chocolatey Packages**

> Close all PowerShell/CMD windows  
> Press Win → type PowerShell\
> Right-click it → choose Run as Administrator

1. Install Chocolatey, the Windows package manager, using a PowerShell script (bypasses execution policy temporarily for the session)

   ```shell
     Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```

2. Install the MinGW compiler (Minimalist GNU for Windows) via Chocolatey for C/C++ development

   ```shell
     choco install mingw
   ```

3. Install LLVM (a modern compiler infrastructure) via Chocolatey, useful for compiling projects with Clang or other LLVM-based tools

   ```shell
   choco install llvm
   ```

4. Install `lazygit` (a simple terminal UI for Git commands) and `fzf` (a fuzzy finder for the terminal) using Chocolatey, with `-y` to auto-confirm

   ```shell
   choco install lazygit fzf -y
   ```

5. Clean up any temporary files or cache created by Chocolatey to free up space and ensure a clean environment

   ```shell
   choco clean --yes
   ```

6. Installs **PowerShell Core** (also known as `pwsh`), the cross-platform, modern version of Windows PowerShell.

   > Useful for scripts, developer tooling, and improved compatibility with modern CLIs and editors.

   ```shell
   choco install powershell-core -y
   ```

### 3. **Add cpp to your env vars**

1. Open a folder
2. Right click in my computer
3. Properts
4. Then click in advanced system configs
5. Ambient vars
6. Click in path
7. In edit add the following path or the path that you installed it (for custom installations) :

   ```
   C:\msys64\mingw64\bin
   ```

8. Save and open new terminal and do the following:

   ```shell
   gcc --version
   g++ --version
   ```

   > It should print the versions

9. If you have installed MSYS2 and want to use its package manager pacman to install additional tools or libraries,
   open the MSYS2 terminal and use the pacman command. For example, to install the GCC compiler, you would use:

   > For a 32-bit system, replace x86_64 with i686. (just replace)

   ```
   pacman -S mingw-w64-ucrt-x86_64-gcc
   ```

10. Remember to update your package database and upgrade the packages with:

    ```
    pacman -Syu
    pacman -Su
    ```

### 4. **Install MSys2 to manange packets**

1. Go to <https://www.msys2.org/>
2. Then donwload this:

   ![image](https://github.com/letalboy/lazyvim-config/assets/63066865/86de645e-f54a-4d11-9834-98fccd67c1e1)

3. Install it as default, you can follow the instructions in the <https://www.msys2.org>

### 5. **Msys2 and MinGW**

  1. Open Msys2 shell and follow the next steps ahead.
  2. Install the GCC (GNU Compiler Collection), which is required for compiling C/C++ code on MSYS2

      ```
      pacman -S gcc
      ```
  3. Install a complete set of development tools and toolchains (both 32-bit and 64-bit) including:
      - `base-devel`: common build utilities (make, etc.)
      - `mingw-w64-*`: MinGW-w64 compilers for cross-platform builds (GCC and Clang for x86_64/i686)
      - `git`, `subversion`, `mercurial`: version control tools
      - `cmake`: build system generator for both 32-bit and 64-bit
    
      **Run the following command:**
      ```
      pacman -S --needed base-devel mingw-w64-i686-toolchain mingw-w64-x86_64-toolchain git subversion mercurial mingw-w64-i686-cmake mingw-w64-x86_64-cmake mingw-w64-ucrt-x86_64-gcc mingw-w64-x86_64-clang
      ```

### 6. **Git Configuration**

> Return to shell with admin privileged:

1. Mark the `LuaSnip` plugin directory as a safe Git directory to prevent Git warnings/errors when it's used by Neovim or other tools

   ```shell
   git config --global --add safe.directory C:/Users/<Your Username>/AppData/Local/nvim-data/site/pack/packer/start/LuaSnip
   ```

### 7. **NPM Packages**

> While in the shell with admin privileges run the following to install the language servers

1. Install Windows-specific build tools necessary for compiling native Node.js modules

   ```shell
   npm install -g windows-build-tools
   ```

2. Install commonly used language servers for HTML, CSS, and JSON (used by VS Code and other editors)

   ```shell
   npm i -g vscode-langservers-extracted
   ```

3. Rebuild native modules for current Node.js version (used after installing or updating modules)

   ```shell
   npm rebuild
   ```

4. Install project-specific development dependencies for TypeScript and Prettier with Astro support

   ```shell
   npm install --save-dev typescript typescript-language-server prettier prettier-plugin-astro
   ```

5. Globally install essential language servers and tools for multiple languages (JS, Astro, Tailwind, Python, JSON)

   ```shell
   npm install -g typescript typescript-language-server node-gyp @astrojs/language-server prettier prettier-plugin-astro eslint-lsp tree-sitter-cli @tailwindcss/language-server pyright vscode-json-languageserver
   ```

6. Install Neovim node bindings globally for better integration with the Neovim editor

   ```shell
   npm install -g neovim
   ```

7. Rebuild again to ensure all global packages and native modules are aligned with the environment

   ```shell
   npm rebuild
   ```

### 8. **Verify if tree sitter is installed**

1. Check the currently installed version of `tree-sitter` to verify it's available and correctly installed

   ```
     tree-sitter --version
   ```

2. (optional) If you encounter errors with Tree-sitter parsing or integration, update the CLI globally to the latest version

   ```shell
     npm update -g tree-sitter-cli
   ```

### 9. (Optional) Required for Python Plugin Support Install Neovim Python Client

> The `--user` flag installs the package for your user only, avoiding the need for admin rights or virtual environments.

1. If you have Python installed, it's recommended to upgrade `pip` to ensure compatibility with modern packages and features.

   ```shell
   python -m pip install --upgrade pip
   ```

2. This installs the `pynvim` library, which is required for Neovim plugins that use Python (e.g., linting, autocompletion, LSPs).

   ```shell
   python -m pip install --user pynvim
   ```

### 10. **Now initialize lazyvim**

1. Ensure that you are in a administrator shell with privileges and then simple do:

   ```shell
   nvim
   ```

2. After this wait all the installations and when you don't see nothing changin in the screen and no messages go to next step

### 11. **Tree-Sitter and Language Servers**

1. In nvim default menu after runing `nvim` in a shell with administrator privileges, use the prompt that opens with ctrl + : and run the following:

   ```
   :TSInstall html javascript css typescript tsx astro
   :TSUpdate
   :TSInstall c cpp
   :TSInstallSync
   :checkhealth nvim-treesitter
   ```

2. After completing these steps, ensure to close the privileged shell and open it again before proceeding with further updates or installations.

## Troubleshooting

> For any issues encountered during the installation or usage of LazyVim, consider the following troubleshooting steps:

1. **Check Compatibility**: Ensure that your system meets all the prerequisites for LazyVim, including Neovim version, operating system compatibility, and any dependencies required by plugins or language servers.

2. **Update Plugins**: Sometimes, issues can be resolved by simply updating your plugins. Use the following command to update your plugins:

   ```
   :PackerUpdate
   ```

3. **Health Checks**: Neovim provides a built-in health check feature. Run `:checkhealth` to identify any problems with your setup, including issues with language servers, tree-sitter, or other integrations.

4. **Consult Documentation**: The [LazyVim documentation](https://lazyvim.github.io/) is an excellent resource for troubleshooting common issues. It may offer specific advice for configuration or compatibility problems.

5. **Community Support**: If you're unable to resolve your issue through documentation, consider seeking help from the LazyVim community. The GitHub issues page or community forums can be valuable resources for solving unique problems.

6. **Reinstall Components**: For persistent issues, reinstalling certain components (like language servers, Neovim, or plugins) might be necessary. Ensure to back up your configuration before doing so.

7. **Review Error Messages**: Pay close attention to any error messages or logs generated by Neovim or plugins. These messages can often provide insight into what is causing the issue.

8. **Configuration Files**: Double-check your `init.vim` or `init.lua` files for any misconfigurations or syntax errors. Sometimes, issues arise from simple typographical errors or incompatible settings.

9. **Compatibility with Other Tools**: Ensure there are no conflicts between LazyVim and other tools or plugins you have installed. Incompatibilities can often cause unexpected behavior.

10. **Operating System Specific Issues**: Be aware of any peculiarities with your operating system, especially if you are using WSL on Windows, as certain features or paths might require specific attention.

---

### How to use ollama as copilot

This lazy setup is prepared with support to ollama using this project: <https://github.com/nomnivore/ollama.nvim>, so to config it download the ollama for your system here: <https://ollama.com/download>, after this install it and config the model that you want by following the instructions in the project page. Afer this, your are done, so you can use it just saying `Ollama` in the prompt of lazy inside a file and you are ready to use it :)
