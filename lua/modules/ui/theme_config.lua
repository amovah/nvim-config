local utils = require("utils")

local function apply_theme_config(theme)
	local scheme = theme
	local splitted = utils.split_string(theme, "_")
	local variant = splitted[utils.table_length(splitted)]
	if utils.table_length(splitted) > 1 then
		scheme = splitted[1]
		for i = 2, utils.table_length(splitted) - 1, 1 do
			scheme = scheme .. "_" .. splitted[i]
		end
	end

	if scheme == "neon" then
		vim.g.neon_style = variant
		vim.g.neon_italic_keyword = true
	elseif scheme == "material" then
		vim.g.material_style = variant
	elseif scheme == "tokyonight" then
		vim.g.tokyonight_style = variant
	elseif scheme == "sonokai" then
		vim.g.sonokai_style = variant
		vim.g.sonokai_better_performance = 1
	elseif scheme == "edge" then
		vim.g.edge_style = variant
		vim.g.edge_dim_foreground = 1
	elseif scheme == "aurora" then
		vim.g.aurora_darker = 1
	elseif scheme == "monokai" then
		if variant ~= "default" then
			scheme = scheme .. "_" .. variant
		end
	elseif scheme == "onedark" then
		vim.g.onedark_config = {
			style = variant,
		}
	elseif scheme == "gruvbox-material" then
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_background = variant
	elseif scheme == "everforest" then
		vim.g.everforest_better_performance = 1
		vim.g.everforest_background = variant
	elseif utils.string_start_with(theme, "github") then
		scheme = theme
	elseif scheme == "catppuccin" then
		vim.g.catppuccin_flavour = variant
		require("catppuccin").setup()
	elseif scheme == "onedarkpro" or scheme == "onedarkpro_onedark" then
		scheme = "onedarkpro"
		if variant == "vivid" then
			variant = "onedark_vivid"
		elseif variant == "dark" then
			variant = "onedark_dark"
		end
		require("onedarkpro").setup({
			dark_theme = variant,
		})
	end

	vim.cmd("colorscheme " .. scheme)
end

local function store_theme(theme)
	local theme_path = vim.fn.stdpath("data") .. "/theme"
	os.execute("echo " .. theme .. " > " .. theme_path)
end

local function setup_theme()
	local theme_path = vim.fn.stdpath("data") .. "/theme"
	if utils.file_exists(theme_path) then
		local theme = utils.lines_from(theme_path)
		for _, value in pairs(theme) do
			apply_theme_config(value)
		end
	else
		vim.cmd("colorscheme zephyr")
	end

	vim.api.nvim_create_user_command("ChangeTheme", function(opts)
		apply_theme_config(opts.args)
		store_theme(opts.args)
	end, {
		nargs = 1,
		complete = function(ArgLead, CmdLine, CursorPos)
			local themes = {
				"neon_default",
				"neon_doom",
				"neon_dark",
				"neon_light",
				"codedark",
				"material_darker",
				"material_ligher",
				"material_oceanic",
				"material_palenight",
				"material_deep ocean",
				"nightfly",
				"moonfly",
				"tokyonight_storm",
				"tokyonight_night",
				"tokyonight_day",
				"sonokai_default",
				"sonokai_atlantis",
				"sonokai_andromeda",
				"sonokai_shusia",
				"sonokai_maia",
				"sonokai_espresso",
				"OceanicNext",
				"OceanicNextLight",
				"edge_default",
				"edge_aura",
				"edge_neon",
				"omni",
				"aurora",
				"monokai_default",
				"monokai_pro",
				"monokai_soda",
				"monokai_ristretto",
				"melange",
				"falcon",
				"nord",
				"onedark_dark",
				"onedark_darker",
				"onedark_cool",
				"onedark_deep",
				"onedark_warm",
				"onedark_warmer",
				"onedark_light",
				"gruvbox-material_hard",
				"gruvbox-material_medium",
				"gruvbox-material_soft",
				"everforest_hard",
				"everforest_medium",
				"everforest_soft",
				"doom-one",
				"vn-night",
				"github_dark",
				"github_dimmed",
				"github_dark_default",
				"github_dark_colorblind",
				"github_light",
				"github_light_default",
				"github_light_colorblind",
				"monochrome",
				"rose-pine",
				"catppuccin_macchiato",
				"catppuccin_latte",
				"catppuccin_frappe",
				"catppuccin_mocha",
				"aquarium",
				"nightfox",
				"dayfox",
				"dawnfox",
				"duskfox",
				"nordfox",
				"terafox",
				"carbonfox",
				"vimdark",
				"everblus",
				"kanagawa",
				"tokyodark",
				"minimal",
				"minimal-base16",
				"adwaita",
				"zephyr",
				"onedarkpro_onedark",
				"onedarkpro_onedark_vivid",
				"onedarkpro_onedark_dark",
			}

			local result = {}
			for _, value in ipairs(themes) do
				if utils.string_start_with(value, ArgLead) then
					table.insert(result, value)
				end
			end

			return result
		end,
	})
end

return setup_theme
