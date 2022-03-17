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
    -   fzf
    -   [ripgrep](https://github.com/BurntSushi/ripgrep)
    -   [fd](https://github.com/sharkdp/fd)

## Installation

Please ensure all requirements are installed. then copy content of this repo to `~/.config/nvim` or create soft-link to `~/.config/nvim` (preferable) then open up your `nvim` and type `:PlugInstall`. restart your nivm and wait to install treesitter grammers, restart nvim one more time then you are good to code.
