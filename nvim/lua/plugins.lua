-- Treesitter
require("nvim-treesitter.configs").setup {
    auto_install = false,

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<cr>",
            node_incremental = "<cr>",
            node_decremental = "<bs>"
        },
    },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
}

-- Lean
require('lean').setup {
    mappings = true
}

-- Remove "virtual text" and make floating info smaller
vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    source = false,
    header = '',
    prefix = '',
  },
})

-- Fixed width number column (to stop shifting stuff horizontally)
vim.wo.signcolumn = "number"
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

-- Add some missing keybindings for LSP
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end
    bufmap('n', 'K', vim.lsp.buf.hover)
    bufmap('n', 'gf', vim.lsp.buf.code_action)
    bufmap('x', 'gf', vim.lsp.buf.code_action)
    bufmap('n', 'gd', vim.lsp.buf.definition)
    bufmap('n', 'gD', vim.lsp.buf.declaration)
    bufmap('n', '[d', vim.diagnostic.goto_prev)
    bufmap('n', ']d', vim.diagnostic.goto_next)
  end
})

-- Other settings to make it more like vscode lol
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.title = true
vim.o.updatetime = 300
vim.cmd [[set clipboard+=unnamedplus]]
vim.opt.undofile = true
vim.opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}

