local opts = {
    noremap = true,
    silent = true
}
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    local map = vim.api.nvim_buf_set_keymap
    map(bufnr, "n", "<space>rn", "<cmd>Lspsaga rename<cr>", opts)
    map(bufnr, "n", "gx", "<cmd>Lspsaga code_action<cr>", opts)
    map(bufnr, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", opts)
    map(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
    map(bufnr, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
    map(bufnr, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    map(bufnr, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
    map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})

    local cfg = {
        debug = false, -- set to true to enable debug logging
        log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
        -- default is  ~/.cache/nvim/lsp_signature.log
        verbose = false, -- show debug line number

        bind = false, -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        -- set to 0 if you DO NOT want any API comments be shown
        -- This setting only take effect in insert mode, it does not affect signature help in normal
        -- mode, 10 by default

        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

        floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
        -- will set to true when fully tested, set to false will use whichever side has more space
        -- this setting will be helpful if you do not want the PUM and floating win overlap

        floating_window_off_x = 1, -- adjust float windows x position.
        floating_window_off_y = 1, -- adjust float windows y position.

        fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = true, -- virtual hint enable
        hint_prefix = "🐼 ", -- Panda for parameter
        hint_scheme = "String",
        hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
        max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
        -- to view the hiding contents
        max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
            border = "rounded" -- double, rounded, single, shadow, none
        },

        always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

        auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
        extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

        padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

        transparency = nil, -- disabled by default, allow floating win transparent value 1~100
        shadow_blend = 36, -- if you using shadow as border use this set the opacity
        shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
        timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
        toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    }

    require"lsp_signature".on_attach(cfg, bufnr)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = {'gopls'}
-- for _, lsp in pairs(servers) do
--     require('lspconfig')[lsp].setup {
--         on_attach = on_attach,
--         flags = {
--             -- This will be the default in neovim 0.7+
--             debounce_text_changes = 150
--         }
--     }
-- end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {'gopls', 'rust_analyzer'}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150
        }
    }
end
