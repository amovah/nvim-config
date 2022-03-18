# Neovim Personal Config

I tried to gather simple neovim config to work with languages and tools I want. I'm not pro vim and I don't know some config and copied from installation guide from plugin page.

## Requirements

-   required:

    -   [vim-plug](https://github.com/junegunn/vim-plug)
    -   [lazygit](https://github.com/jesseduffield/lazygit)
    -   [glow](https://github.com/charmbracelet/glow) (I think it will be installed automatically, not tested yet)
    -   [gopls](https://github.com/golang/tools/tree/master/gopls)
    -   [rust-analyzer](https://rust-analyzer.github.io/manual.html#installation)
    -   preitter: `npm install -g prettier`
    -   tsserver: `npm install -g typescript typescript-language-server`
    -   eslint: `npm install -g vscode-langservers-extracted`

-   optional:

    -   [fzf](https://github.com/junegunn/fzf.vim)
    -   [ripgrep](https://github.com/BurntSushi/ripgrep)
    -   [fd](https://github.com/sharkdp/fd) (make sure to fix bin alias)

## Installation

Please ensure all requirements are installed. then copy content of this repo to `~/.config/nvim` or create soft-link to `~/.config/nvim` (preferable) then open up your `nvim` and type `:PlugInstall`. restart your nivm and wait to install treesitter grammers, restart nvim one more time then you are good to code.

If you want to use `nvim` as `mergetool`, add `.gitconfig` content to yours.

### Which Key?

There is which key plugin which helps you to press right key and find your way if you forget one (try `,s` and wait for whichkey to pop out).

### hotkeys:

Check Plugins section and their config file which mentioned in this readme, to check all hotkeys available for you.

**top noteworthy hotkeys:**

-   leader key: `,`
-   file explorer:

    -   `-`: show nvim tree
    -   `<leader>sf`: find in file names
    -   `<leader>sb`: find in current file/buffer

    -   `<leader>sp`: find in all files

-   LSP:

    -   `gD`: go to declaration
    -   `gd`: go to definition
    -   `gi`: go to implementation
    -   `gr`: go to reference
    -   `go`: line diagnostic
    -   `gx`: code action
    -   `gj`: next diagnostic
    -   `gk`: previous diagnostic
    -   `<space>d`: go to type definition
    -   `<space>rn`: rename
    -   `<leader>xx`: trouble (diagnostic list for project)

-   buffer:

    -   `Tab`,`Shift-Tab`: change between tabs
    -   `Ctrl-W arrow-key`: switch between windows in one buffer (like outline menu, trouble menu and file tree)
    -   `<leader>q`: close buffer/window
    -   `<leader>db`: close all buffer except active one

-   `<leader>gg`: lazygit

### Plugins

#### Basics

Basic configs like leader key defination, relative line show number...

Config file: `basics.vim`

#### LSP

Neovim built-in language service client [LSP](https://github.com/neovim/nvim-lspconfig) is used. LSP is also used for formatting. If you want to add your own language, just install your LSP and add it into `lsp/configs.lua` file. make sure to add your file in `lsp/auto-format-files.vim` if you want to format your files with lsp.

All files under `lsp` directory are related to LSP, completing, formatting.

Config file: `lsp/configs.lua` **hotkeys** , `lsp/*`

#### Diagnostic

[Trouble](https://github.com/folke/trouble.nvim)

Config file: `trouble.lua` **hotkeys**

#### Better Syntax Highlighter

[treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Config File: `treesitter.lua`

##### Formatting

Config file: `lsp/auto-format-files.vim`

#### Symbols

[symbol-outline](https://github.com/simrat39/symbols-outline.nvim)

Config file: `symbol-outline.lua` **hotkeys**

#### Indention

[indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)

Config file: `indent.lua`

By default all files are indent as 4 tab size, you can change the default config: `file-specific-indention.vim`

#### Comment

[Comment.nvim](https://github.com/numToStr/Comment.nvim) - check link for **hotkeys**

Config file: `comment.lua`

#### Status Line

[lualine](https://github.com/nvim-lualine/lualine.nvim)

Config file: `lualine.lua`

#### Buffer

[bufferline](https://github.com/akinsho/bufferline.nvim)

Config files: `buffers.vim` - **hotkeys**, `bufferline.lua`

#### Git

[fugitive.vim](https://github.com/tpope/vim-fugitive) - check link for more info about how to work with vim fugitive, [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim), [lazygit](https://github.com/jesseduffield/lazygit)

Config file: `lazygit.lua` **hotkeys**

#### File explorer

[nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)

Config file: `nvim-tree.lua` **hotkeys**

#### Finder

[Telescope](https://github.com/nvim-telescope/telescope.nvim)

Config file: `telescope.lua` **hotkeys**

#### Find and Replace

[CtrlSF](https://github.com/dyng/ctrlsf.vim) - check the link for guide.

#### Theme

you can change or add theme in config file.

Config file: `theme-config.lua`

#### Markdown preview

[glow.nvim](https://github.com/ellisonleao/glow.nvim)

Config File: `glow.vim` **hotkeys**

#### Database

[dadbod.vim](https://github.com/tpope/vim-dadbod), [dadbod.vim.ui](https://github.com/kristijanhusak/vim-dadbod-ui)

Config file: `dadbiod.vim` **hotkeys**
