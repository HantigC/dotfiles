local utils = {}
function utils.safe_import(import_name, setup_function)

  local status_ok, module = pcall(require, import_name)
  if not status_ok then
    vim.notify(import_name .. " not loaded!")
    return
  end
  setup_function(module)
  vim.notify(import_name .. " loaded!")
  return
end

return utils
