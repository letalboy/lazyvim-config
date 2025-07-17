return {
  {
    "folke/snacks.nvim",
    opts = {
      -- Disable scope feature that's causing the window ID error
      scope = { enabled = false },
      
      -- Configure indent more safely
      indent = {
        enabled = true,
        -- Add safety checks for window validation
        priority = 200,
        chunk = {
          enabled = false, -- Disable chunk highlighting that can cause window issues
        },
      },
      
      -- Keep other features enabled but with safer defaults
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      
      -- Disable features that commonly cause window ID issues
      animate = { enabled = false },
      scroll = { enabled = false },
    },
  },
  
  -- ALTERNATIVE: Completely disable snacks.nvim if errors persist
  -- Uncomment the lines below and comment out the configuration above
  -- {
  --   "folke/snacks.nvim",
  --   enabled = false,
  -- },
} 