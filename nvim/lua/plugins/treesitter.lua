return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'typescript', 'javascript', 'python', 'tsx' },
    highlight = {
      enable = true,
    },
  },
}
