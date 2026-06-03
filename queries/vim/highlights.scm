; Local override for Neovim 0.11.4 on Windows.
; The bundled Vim query references node "substitute", but the bundled vim.dll
; parser does not expose that node, which breaks the decoration provider.
