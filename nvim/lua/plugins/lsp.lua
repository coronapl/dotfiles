return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local builtin = require 'telescope.builtin'

          vim.keymap.set('n', 'gd', builtin.lsp_definitions, { buffer = event.buf, desc = '[G]oto [D]efinition' })
          vim.keymap.set('n', 'gr', builtin.lsp_references, { buffer = event.buf, desc = '[G]oto [R]eferences' })
          vim.keymap.set('n', 'gI', builtin.lsp_implementations, { buffer = event.buf, desc = '[G]oto [I]mplementation' })
          vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, { buffer = event.buf, desc = 'Type [D]efinition' })
          vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { buffer = event.buf, desc = '[D]ocument [S]ymbols' })
          vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { buffer = event.buf, desc = '[W]orkspace [S]ymbols' })
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = event.buf, desc = '[R]e[n]ame' })
          vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = '[C]ode [A]ction' })
          vim.keymap.set('n', '<leader>e', function()
            vim.diagnostic.open_float(nil, { scope = 'line' })
          end, { buffer = event.buf, desc = 'Open Diagnostics' })

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            vim.keymap.set('n', '<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, { desc = '[T]oggle Inlay [H]ints' })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'vtsls', 'eslint', 'pyright', 'astro' },
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
