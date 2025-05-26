return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,         -- must load _before_ nvim-tree
    opts = {
      default = true,     -- fallback icon
      color_icons = true, -- enable per-filetype colors
      override = {},      -- you can override individual glyphs here
    },
  },
}
