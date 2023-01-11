local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'ft', builtin.treesitter, {})



require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}


local lspconfig = require('lspconfig')

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			vim.keymap.set('n',"gd", function() vim.lsp.buf.definition() end)
			vim.keymap.set('n',"K", function() vim.lsp.buf.hover() end)
			vim.keymap.set('n',"[d", function() vim.diagnostic.goto_next() end)
			vim.keymap.set('n',"]d", function() vim.diagnostic.goto_prev() end)
			vim.keymap.set('i',"<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end


-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
require("lspconfig").pyright.setup(config())
require("lspconfig").gopls.setup(config())
require("lspconfig").clangd.setup(config())
require("lspconfig").tsserver.setup(config())
require("lspconfig").rust_analyzer.setup(config({
        -- rustup run stable rust-analyzer -h
        cmd = { "rustup", "run", "stable", "rust-analyzer" },
    }))


-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
   window = {
    completion = { -- rounded border; thin-style scrollbar
      -- border = 'rounded',
    },
    documentation = { -- no border; native-style scrollbar
      -- border = 'rounded',
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lsp_signature_help' },
  },
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python", "c", "rust", "go", },
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}
