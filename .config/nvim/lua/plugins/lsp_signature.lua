require("utils").safe_import(
  "lsp_signature",
  function (lsp_signature)
    lsp_signature.setup({

    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
  })

  end
)
