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
    -   [fd](https://github.com/sharkdp/fd)

## Installation

Please ensure all requirements are installed. then copy content of this repo to `~/.config/nvim` or create soft-link to `~/.config/nvim` (preferable) then open up your `nvim` and type `:PlugInstall`. restart your nivm and wait to install treesitter grammers, restart nvim one more time then you are good to code.

## Shortcuts

-   **-**: Show nvim tree
-   **'leader'p**: Show preview
-   **'leader'o**: Show outline
-   **'leader'gg**: Open lazygit
-   **'leader'?**: Show a list of old files
-   **'leader'sf**: Find a file
-   **'leader'[space]**: Find a file in current buffers
-   **'leader'r**: Refresh nvim tree
-   **'leader'db**: Close all files except active buffer
-   **'leader'sb**: Search a word in current buffer
-   **'leader'sd**: Search a word in the project
-   **'leader'xx**: Trouble menu
-   **'leader'xw**: Open Workspace diagnostic
-   **loremPara**: Lorem Ipsum
-   **2x2table**: Create a table in markdown
-   **l + TAB + ENTER**: Create a link in markdown
-   **h1..6 + TAB**: Create a heading in markdown
