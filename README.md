my custom nvim config. inspired by cosynvim by gelpnier.

There is couple options which worth to mention:

## Change Theme

I've struggled so much with changing a theme which I had to open up config change it to keep forever. so I've written a simple command to apply config for specific colorscheme, then change colorscheme and store it to a file which you can load your nvim and you can see you have changed your colorscheme permanantly without doing configs.

- Command: `ChangeTheme`
- Args: 1
- Options: there is simple auto complete which you can see full list of configured colorscheme.

## Customization

Customization is possbile by editing `lua/config_local.lua` file which is already gitignored. All changes except managing plugins are possible.

## Update Notifier

if you clone it as git repo, you can get a notification when new update comes out.

## Requirement

1. [ripgrep](https://github.com/BurntSushi/ripgrep) and [fd](https://github.com/sharkdp/fd)
