function go_organize_imports_sync(timeout_ms)
  local params = vim.lsp.util.make_range_params()

  params.context = {only = {"source.organizeImports"}}

  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
  vim.lsp.buf.formatting_sync(nil, timeout_ms)
end

vim.cmd [[
  augroup golang
    autocmd!
    autocmd BufWritePre *.go lua go_organize_imports_sync(1000)
  augroup end
]]
