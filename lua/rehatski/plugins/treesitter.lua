return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { 'html', 'javascript', 'json', 'lua', 'tsx', 'typescript', 'vimdoc' },
        auto_install = true,
        sync_install = false,

        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
