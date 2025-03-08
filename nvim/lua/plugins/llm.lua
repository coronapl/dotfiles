return {
  {
    'olimorris/codecompanion.nvim',
    config = function()
      require('codecompanion').setup {
        display = {
          action_palette = {
            provider = 'telescope',
          },
        },
        strategies = {
          chat = {
            adapter = 'anthropic',
          },
          inline = {
            adapter = 'anthropic',
          },
        },
      }
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
