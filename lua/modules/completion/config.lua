local config = {}

function config.lspsaga()
	local saga = require('lspsaga')
	saga.init_lsp_saga({
		-- symbol_in_winbar = {
		--   enable = true,
		-- },
	})
end

return config
