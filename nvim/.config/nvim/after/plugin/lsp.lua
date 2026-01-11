vim.opt.completeopt = { "menu", "menuone", "noselect", "fuzzy" }
-- vim.opt.autocomplete = true
-- vim.opt.complete = 'o,.,w,b,u'

-- Optional: Set a maximum height for the popup menu
vim.opt.pumheight = 10

local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    {
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true, -- Crucial for gopls to trigger correctly
            },
        },
    },
}
)

--
-- Add the same capabilities to ALL server configurations.
-- Refer to :h vim.lsp.config() for more information.
vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = { '.git'}
})

local nachogroup = vim.api.nvim_create_augroup('nachogroup', {})

vim.api.nvim_create_autocmd('LspAttach', {
    group = nachogroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = 'rounded' }) end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

        vim.keymap.set("n", "<leader>vh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "Toggle LSP Inlay Hints" })


        local client = assert(vim.lsp.get_client_by_id(e.data.client_id))
        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
          -- Optional: trigger autocompletion on EVERY keypress. May be slow!
          -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
          -- client.server_capabilities.completionProvider.triggerCharacters = chars

          vim.lsp.completion.enable(true, client.id, e.buf, {autotrigger = true})
        end

        
        -- Inlay hints
        if client:supports_method("textDocument/inlayHints") then
            vim.lsp.inlay_hint.enable(false, { bufnr = e.buf })
        end

        if client:supports_method("textDocument/documentColor") then
            vim.lsp.document_color.enable(true, e.buf, {
                style = "background", -- 'background', 'foreground', or 'virtual'
            })
        end
    end,
})


vim.diagnostic.config({
    -- update_in_insert = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.lsp.config('lua-ls', {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".git" },
    settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
        },
    },
})

vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.work", "go.mod", ".git" },
})

vim.lsp.config("clangd",  {
  cmd = {
    'clangd',
    '--clang-tidy',
    '--background-index',
    '--offset-encoding=utf-8',
  },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
})

vim.lsp.enable({
    'lua_ls',
    'clangd',
    'gopls'
})
