-- lua/plugins/block-copy.lua
return {
  {
    "LazyVim/LazyVim",
    keys = (function()
      local function yank_or_delete_block(action) -- "y" or "d"
        local openers = { ["{"] = "}", ["("] = ")", ["["] = "]", ["<"] = ">" }
        local ln = vim.fn.getline(".")
        local col = vim.fn.col(".")
        local ch = ln:sub(col, col)

        -- If not on an opener, scan to the right on this line
        if not openers[ch] then
          for i = col + 1, #ln do
            local c = ln:sub(i, i)
            if openers[c] then
              ch = c
              vim.fn.cursor(vim.fn.line("."), i)
              break
            end
          end
        end

        if not openers[ch] then
          vim.notify("No block opener at/after cursor on this line.", vim.log.levels.WARN)
          return
        end

        -- Select opener→closer and perform action: v%y or v%d
        vim.cmd("normal! v%" .. action)
        -- ensure we’re back to normal mode
        local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
        vim.api.nvim_feedkeys(esc, "n", false)
      end

      local M = {}

      -- Copy whole block (Ctrl+C then b)
      table.insert(M, {
        "<C-c>b",
        function()
          yank_or_delete_block("y")
        end,
        desc = "Copy block (opener → match)",
        mode = "n",
        silent = true,
      })

      -- Cut whole block (Ctrl+X then b)
      table.insert(M, {
        "<C-x>b",
        function()
          yank_or_delete_block("d")
        end,
        desc = "Cut block (opener → match)",
        mode = "n",
        silent = true,
      })

      return M
    end)(),
  },
}
