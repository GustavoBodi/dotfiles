require("nvim-lsp-installer").setup{}
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.diagnostic.config{virtual_text=true}
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-cr>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['omnisharp'].setup{}

require('lspconfig')['eslint'].setup{}

require('lspconfig')['svls'].setup {
  default_config = {
    cmd = { "svls", "-d" },
    filetypes = { "verilog", "systemverilog" },
    root_dir = ".git"
  };
  docs = {
    description = [[
      https://github.com/dalance/svls
      Language server for verilog and SystemVerilog
    ]];
  }
}

require('lspconfig')['html'].setup {
  flags = lsp_flags,
    filetypes = {"rust"},
    init_options = {
      userLanguages = {
        rust = "html",
      }
    }
}

require('lspconfig')['clangd'].setup {
  flags = lsp_flags,
}

local configs = require("lspconfig.configs")
local nvim_lsp = require("lspconfig")
if not configs.neocmake then
    configs.neocmake = {
        default_config = {
            cmd = { "neocmakelsp", "--stdio" },
            filetypes = { "cmake" },
            root_dir = function(fname)
                return nvim_lsp.util.find_git_ancestor(fname)
            end,
            single_file_support = true,-- suggested
            on_attach = function(client, bufnr)
              on_attach(client, bufnr)
            end,
            init_options = {
                format = {
                    enable = true
                }
            }
        }
    }
    nvim_lsp.neocmake.setup({})
end

require'lspconfig'.tailwindcss.setup{
    flags = lsp_flags,
    filetypes = {"rust", "svelte", "javascript", "typescript", "typescriptreact"},
    init_options = {
      userLanguages = {
        rust = "html",
      }
    }
}

require('lspconfig')['lua_ls'].setup{
    flags = lsp_flags,
}

require('lspconfig')['bashls'].setup{
    flags = lsp_flags,
}

require('lspconfig')['texlab'].setup{
    flags = lsp_flags,
}

require('lspconfig')['pylsp'].setup{
    flags = lsp_flags,
}

require('lspconfig')['asm_lsp'].setup{
    flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup{
    flags = lsp_flags,
    init_options = {
      preferences = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
        importModuleSpecifierPreference = 'non-relative',
      },
    },
    on_attach = function(client, bufnr)
      vim.lsp.inlay_hint(bufnr, true)
      on_attach(client, bufnr)
    end,
}

require('lspconfig')['rust_analyzer'].setup{
    flags = lsp_flags,
    -- Server-specific settings...
    init_options = {
      preferences = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
        importModuleSpecifierPreference = 'non-relative',
      },
    },
    on_attach = function(client, bufnr)
      vim.lsp.inlay_hint(bufnr, true)
      on_attach(client, bufnr)
    end,
}

require'lspconfig'.hdl_checker.setup{}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.rs' },
  command = 'lua vim.lsp.inlay_hint(1, true)',
  group = vim.api.nvim_create_augroup('MyAutocmdsRustInlayHints', {}),
})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
  command = 'silent! EslintFixAll',
  group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
})
