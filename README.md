

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim). Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

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

### Installation and Setup Commands

To set up language servers, compilers, and other tools, follow these commands in sequence:

1. **Windows Subsystem for Linux (WSL)**:

   ```
   wsl --install
   ```

2. **Chocolatey Packages**:

   Run in a administrator shell

   ```shell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```
   ```shell
    choco install mingw
   ```
   ```shell
   choco install llvm
   ```

4. **Add cpp to your env vars**

  - Open a folder
  - Right click in my computer
  - Properts
  - Then click in advanced system configs
  - Ambient vars
  - Click in path
  - Then in edit
  - And add the following path:

    ```
    C:\msys64\mingw64\bin
    ```
 - Or the path that you installed it, then save and open new terminal and do the following:
   ```shell
    gcc --version
    g++ --version
   ```
- It should print the versions
- If you have installed MSYS2 and want to use its package manager pacman to install additional tools or libraries,
open the MSYS2 terminal and use the pacman command. For example, to install the GCC compiler, you would use:

  ```
  pacman -S mingw-w64-ucrt-x86_64-gcc
  ```
- For a 32-bit system, replace x86_64 with i686. Remember to update your package database and upgrade the packages with:
  ```
  pacman -Syu
  pacman -Su
  ```

4. **Install MSys2 to manange packets**
  - Go to https://www.msys2.org/
  - Then donwload this:

![image](https://github.com/letalboy/lazyvim-config/assets/63066865/86de645e-f54a-4d11-9834-98fccd67c1e1)

  - Install it as default, you can follow the instructions in the msys2.org

5. **Msys2 and MinGW**:

   Open Msys2 shell and run
   ```
   pacman -S gcc
   ```
   ```
   pacman -S --needed base-devel mingw-w64-i686-toolchain mingw-w64-x86_64-toolchain git subversion mercurial mingw-w64-i686-cmake mingw-w64-x86_64-cmake mingw-w64-ucrt-x86_64-gcc mingw-w64-x86_64-clang 
   ```
  
5. **Git Configuration**:

   return to shell with admin privileged and run:

   ```shell
   git config --global --add safe.directory C:/Users/<Your Username>/AppData/Local/nvim-data/site/pack/packer/start/LuaSnip
   ```

6. **NPM Packages**:

   While in the shell with admin privileges run the following to install the language servers

   ```
   npm install -g windows-build-tools
   ```
   ```shell
   npm rebuild
   ```
   ```shell
   npm install --save-dev typescript typescript-language-server prettier prettier-plugin-astro 
   ```
   ```shell
   npm install -g typescript typescript-language-server node-gyp @astrojs/language-server prettier prettier-plugin-astro eslint-lsp tree-sitter-cli @tailwindcss/language-server pyright vscode-json-languageserver 

   ```
   ```shell
   npm rebuild
   ```

6. **Verify if tree sitter is installed**

  ```
    tree-sitter --version
  ```

  - if you get errors in treesitter try to update it:
    ```shell
      npm update -g tree-sitter-cli
    ```


6. **Now initialize lazyvim**
   Ensure that you are in a administrator shell with privileges and then simple do:

   ```shell
   nvim
   ```

   after this wait all the installations and when you don't see nothing changin in the screen and no messages go to next step

7. **Tree-Sitter and Language Servers**:
   in nvim default menu after runing `nvim` in a shell with administrator privileges, use the prompt that opens with ctrl + : and run the following:
   ```
   :TSInstall html javascript css typescript tsx astro
   :TSUpdate
   :TSInstall c cpp
   :TSInstallSync
   :checkhealth nvim-treesitter
   ```

After completing these steps, ensure to close the privileged shell and open it again before proceeding with further updates or installations.

### Troubleshooting

For any issues encountered during the installation or usage of LazyVim, consider the following troubleshooting steps:

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
This lazy setup is prepared with support to ollama using this project: https://github.com/nomnivore/ollama.nvim, so to config it download the ollama for your system here: https://ollama.com/download, after this install it and config the model that you want by following the instructions in the project page. Afer this, your are done, so you can use it just saying `Ollama` in the prompt of lazy inside a file and you are ready to use it :)
