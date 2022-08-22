require('keymap.config')
local key = require('core.keymap')
local nmap = key.nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd

-- usage of plugins
nmap({
  -- packer
  { '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
  { '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
  { '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- nvimtree
  { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
  -- LSP
  { 'gd', vim.lsp.buf.definition, opts(noremap, silent) },
  { '[e', cmd('Lspsaga diagnostic_jump_next'), opts(noremap, silent) },
  { ']e', cmd('Lspsaga diagnostic_jump_prev'), opts(noremap, silent) },
  { 'K', cmd('Lspsaga hover_doc'), opts(noremap, silent) },
  { 'gx', cmd('Lspsaga code_action'), opts(noremap, silent) },
  -- { 'gd', cmd('Lspsaga preview_definition'), opts(noremap, silent) },
  { 'gs', cmd('Lspsaga signature_help'), opts(noremap, silent) },
  { 'gr', cmd('Lspsaga rename'), opts(noremap, silent) },
  { 'gh', cmd('Lspsaga lsp_finder'), opts(noremap, silent) },
  -- Telescope
  { '<Leader>fb', cmd([[lua require('telescope.builtin').buffers()]]), opts(noremap, silent) },
  { '<Leader>ff', cmd([[lua require('telescope.builtin').find_files()]]), opts(noremap, silent) },
  { '<Leader>fi', cmd([[lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})]]), opts(noremap, silent) },
  { '<Leader>fa', cmd([[lua require('telescope.builtin').live_grep()]]), opts(noremap, silent) },
  { '<Leader>fw', cmd([[lua require('telescope.builtin').grep_string()]]), opts(noremap, silent) },
  { '<Leader>fc', cmd([[lua require('telescope.builtin').current_buffer_fuzzy_find()]]), opts(noremap, silent) },
  { '<Leader>fsd', cmd([[lua require('telescope.builtin').lsp_document_symbols()]]), opts(noremap, silent) },
  { '<Leader>fsa', cmd([[lua require('telescope.builtin').lsp_dynamic_workspace_symbols()]]), opts(noremap, silent) },
  { '<Leader>fst', cmd([[lua require('telescope.builtin').treesitter()]]), opts(noremap, silent) },
  { '<Leader>fr', cmd([[lua require('telescope.builtin').lsp_references()]]), opts(noremap, silent) },
  -- Buffer
  { ']b', cmd('BufferLineCycleNext'), opts(noremap, silent) },
  { '[b', cmd('BufferLineCyclePrev'), opts(noremap, silent) },
  { '<Leader>bs', cmd('BufferLineSortByDirectory'), opts(noremap, silent) },
})
