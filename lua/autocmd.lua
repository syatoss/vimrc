-- this file contains event handlers 
-- use :h event to see list of possible event to react to
-- the syntax is (_eventType_, pattern=_casesWhichShouldCallCallback_, callback=_theFucntionToExecute_)
vim.api.nvim_create_autocmd("BufWrite", {
  pattern = {
    "*.lua", "*.c", "*.h", "*.js", "*.jsx", "*.ts", "*.tsx", "*.html",
    "*.css", "*.py", "*.sh", "*.vim", "*.pyc"
  },
  callback = function() vim.lsp.buf.formatting_sync() end
})
