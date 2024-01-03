return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_fix" },
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "biome" },
        jsx = { "biome" },
        sh = { "shfmt" },
        ['*'] = { 'trim_whitespace', 'codespell' },
      },
  },
  lazy = false,
}
