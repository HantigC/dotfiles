require("utils").safe_import(
  "snippy",
  function (snippy)
    snippy.setup({
      mappings = {
        is = {
          ['<Tab>'] = 'expand_or_advance',
          ['<S-Tab>'] = 'previous',
        },
        nx = {
          ['<leader>x'] = 'cut_text',
        },
      },
    })
  end
)
