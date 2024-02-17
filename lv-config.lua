-- Svelte language server settings
vim.lang.svelte.lsp.setup = {
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  -- Add other settings if necessary
}

vim.use("evanleck/vim-svelte")
vim.use("iamcco/markdown-preview.nvim")
vim.use("numToStr/Comment.nvim")
vim.use("wuelnerdotexe/vim-astro")

vim.filetype.add({
  extension = {
    astro = "astro",
  },
})
