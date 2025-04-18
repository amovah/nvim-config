-- inspired by https://github.com/jdhao/nvim-config
vim.loader.enable()

local utils = require("utils")

local expected_version = "0.11.0"
utils.is_compatible_version(expected_version)

require("globals")
require("core")
require("modules.ui.theme_config").colorscheme_conf.gruvbox_material()
