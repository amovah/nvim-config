require('keymap.config')
local key = require('core.keymap')
local nmap = key.nmap
local vmap = key.vmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd

nmap({
  -- packer
  { '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
  { '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
  { '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
  { '<Leader>ps', cmd('PackerSync'), opts(noremap, silent) },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- nvimtree
  { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
  -- LSP
  { 'gd', vim.lsp.buf.definition, opts(noremap, silent) },
  -- { 'gd', cmd('Lspsaga preview_definition'), opts(noremap, silent) },
  { 'gr', cmd([[lua require('telescope.builtin').lsp_references()]]), opts(noremap, silent) },
  { '[e', cmd('Lspsaga diagnostic_jump_next'), opts(noremap, silent) },
  { ']e', cmd('Lspsaga diagnostic_jump_prev'), opts(noremap, silent) },
  { 'K', cmd('Lspsaga hover_doc'), opts(noremap, silent) },
  { 'gx', cmd('Lspsaga code_action'), opts(noremap, silent) },
  { 'gs', cmd('Lspsaga signature_help'), opts(noremap, silent) },
  { 'gR', cmd([[lua vim.lsp.buf.rename()]]), opts(noremap, silent) },
  -- { 'gR', cmd('Lspsaga rename'), opts(noremap, silent) },
  { 'gh', cmd('Lspsaga lsp_finder'), opts(noremap, silent) },
  { 'go', cmd('Lspsaga show_line_diagnostics'), opts(noremap, silent) },
  -- Telescope
  { '<Leader>fb', cmd([[lua require('telescope.builtin').buffers()]]), opts(noremap, silent) },
  { '<Leader>ff', cmd([[lua require('telescope.builtin').find_files()]]), opts(noremap, silent) },
  { '<Leader>fi', cmd([[lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})]]),
    opts(noremap, silent) },
  { '<Leader>fa', cmd([[lua require('telescope.builtin').live_grep()]]), opts(noremap, silent) },
  { '<Leader>fw', cmd([[lua require('telescope.builtin').grep_string()]]), opts(noremap, silent) },
  { '<Leader>fc', cmd([[lua require('telescope.builtin').current_buffer_fuzzy_find()]]), opts(noremap, silent) },
  { '<Leader>fsd', cmd([[lua require('telescope.builtin').lsp_document_symbols()]]), opts(noremap, silent) },
  { '<Leader>fsa', cmd([[lua require('telescope.builtin').lsp_dynamic_workspace_symbols()]]), opts(noremap, silent) },
  { '<Leader>fst', cmd([[lua require('telescope.builtin').treesitter()]]), opts(noremap, silent) },
  { '<Leader>fr', cmd([[lua require('telescope.builtin').lsp_references()]]), opts(noremap, silent) },
  { '<Leader>fd', cmd([[lua require('telescope.builtin').diagnostics()]]), opts(noremap, silent) },
  { '<Leader>fe', cmd([[Telescope file_browser]]), opts(noremap, silent) },
  { '<Leader>ft', cmd([[Telescope]]), opts(noremap, silent) },
  { '<Leader>fp', cmd('Telescope neoclip'), opts(noremap, silent) },
  -- Buffer
  { ']b', cmd('BufferLineCycleNext'), opts(noremap, silent) },
  { '[b', cmd('BufferLineCyclePrev'), opts(noremap, silent) },
  { '<Leader>bs', cmd('BufferLineSortByDirectory'), opts(noremap, silent) },
  -- Trouble
  { '<Leader>xx', cmd('Trouble'), opts(noremap, silent) },
  { '<Leader>xw', cmd('Trouble workspace_diagnostics'), opts(noremap, silent) },
  { '<Leader>xd', cmd('Trouble document_diagnostics'), opts(noremap, silent) },
  { '<Leader>xl', cmd('Trouble loclist'), opts(noremap, silent) },
  { '<Leader>xq', cmd('Trouble quickfix'), opts(noremap, silent) },
  -- { 'gr', cmd('Trouble lsp_references'), opts(noremap, silent) },
  -- Lazygit
  { '<Leader>gg', cmd('LazyGit'), opts(noremap, silent) },
  -- refactoring
  { '<Leader>rp', cmd([[lua require('refactoring').debug.printf({below = false})]]), opts(noremap, silent) },
  { '<Leader>rv', cmd([[lua require('refactoring').debug.print_var({ normal = true })]]), opts(noremap, silent) },
  { '<Leader>rc', cmd([[lua require('refactoring').debug.cleanup({})]]), opts(noremap, silent) },
  -- clear highlighted search
  { '<C-l>', cmd('noh'), opts(noremap, silent) },
  -- harpoon
  { '<Leader>hh', cmd([[lua require("harpoon.ui").toggle_quick_menu()]]), opts(noremap, silent) },
  { '<Leader>ha', cmd([[lua require("harpoon.mark").add_file()]]), opts(noremap, silent) },
  { '<Tab>', cmd([[lua require("harpoon.ui").nav_next()]]), opts(noremap, silent) },
  { '<S-Tab>', cmd([[lua require("harpoon.ui").nav_prev()]]), opts(noremap, silent) },
})

vmap({
  -- refactoring
  { '<leader>rr', cmd([[lua require('refactoring').select_refactor()]]), opts(noremap, silent) },
  { '<leader>rv', cmd([[lua require('refactoring').debug.print_var({})]]), opts(noremap, silent) },
})
