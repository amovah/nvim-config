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

	if scheme == "material" then
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
		require("catppuccin").setup({
			flavour = variant,
			transparent_background = true,
		})
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

	vim.cmd.colorscheme(scheme)
end

local function apply_transparent_config(isSet)
	if isSet then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
end

local function store_theme(theme)
	local theme_path = vim.fn.stdpath("data") .. "/theme"
	os.execute("echo " .. theme .. " > " .. theme_path)
end

local function store_transparent(isSet)
	local transparent_path = vim.fn.stdpath("data") .. "/transparent"
	os.execute("echo " .. tostring(isSet) .. " > " .. transparent_path)
end

local function setup_theme()
	local theme_path = vim.fn.stdpath("data") .. "/theme"
	if utils.file_exists(theme_path) then
		local theme = utils.lines_from(theme_path)
		for _, value in pairs(theme) do
			apply_theme_config(value)
		end
	else
		apply_theme_config("zephyr")
	end

	local transparent_path = vim.fn.stdpath("data") .. "/transparent"
	if utils.file_exists(transparent_path) then
		local theme = utils.lines_from(transparent_path)
		for _, value in pairs(theme) do
			apply_transparent_config(value == "true")
		end
	end

	vim.api.nvim_create_user_command("SetTransparent", function()
		apply_transparent_config(true)
		store_transparent(true)
	end, {})

	vim.api.nvim_create_user_command("ChangeTheme", function(opts)
		apply_theme_config(opts.args)
		store_theme(opts.args)
		apply_transparent_config(false)
		store_transparent(false)
	end, {
		nargs = 1,
		complete = function(ArgLead, _, _)
			local themes = {
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
				"aurora",
				"monokai_default",
				"monokai_pro",
				"monokai_soda",
				"monokai_ristretto",
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
				"github_dark",
				"github_dimmed",
				"github_dark_default",
				"github_dark_colorblind",
				"github_light",
				"github_light_default",
				"github_light_colorblind",
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
				"everblush",
				"kanagawa",
				"tokyodark",
				"minimal",
				"minimal-base16",
				"adwaita",
				"zephyr",
				"onedarkpro_onedark",
				"onedarkpro_onedark_vivid",
				"onedarkpro_onedark_dark",
				"oxocarbon",
				"ayu-dark",
				"ayu-light",
				"ayu-migrage",
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
