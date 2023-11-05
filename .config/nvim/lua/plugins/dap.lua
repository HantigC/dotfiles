local function pick_executable(callback)
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')

  -- This will list all files and allow you to pick, adjust the search pattern as needed
  telescope.setup {}
  builtin.find_files({
    prompt_title = 'Select Executable',
    cwd = 'build/', -- Adjust this to the directory containing your executables
    find_command = {'find', '.', '-type', 'f', '-executable'},
    attach_mappings = function(_, map)
      local actions = require('telescope.actions')
      actions.select_default:replace(function(prompt_bufnr)
        local action_state = require('telescope.actions.state')
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        callback(selection.value)
      end)
      return true
    end
  })
end

local function debug_program(program)
  local dap = require('dap')
  dap.run({
    type = 'lldb',
    request = 'launch',
    name = "Debug Selected Program",
    program = program,
    -- Add other necessary options here
  })
end

-- Command to start the executable picker and debug process
vim.api.nvim_create_user_command('DebugPickExecutable', function()
  pick_executable(function(executable)
    debug_program(executable)
  end)
end, {})

require("utils").safe_import(
  "dap",
  function (dap)
    vim.keymap.set('n', '<c-c>',  dap.continue)
    vim.keymap.set('n', '<c-n>',  dap.step_over)
    vim.keymap.set('n', '<c-d>',  dap.step_into)
    vim.keymap.set('n', '<c-e>',  dap.step_out)
    vim.keymap.set('n', '<c-b>',  dap.toggle_breakpoint)
    vim.keymap.set('n', '<leader>dr', dap.run_to_cursor)

    vim.keymap.set('n', "<leader>dC", function() dap.set_breakpoint(vim.fn.input "[Condition] > ") end)
    vim.keymap.set('n', "<leader>dg",  dap.session)
    vim.keymap.set('n', "<leader>dt",  dap.terminate)

    --{ "<leader>dR", function() require("dap").run_to_cursor() end, desc = "Run to Cursor", },
    --{ "<leader>dE", function() require("dapui").eval(vim.fn.input "[Expression] > ") end, desc = "Evaluate Input", },
    --{ "<leader>dU", function() require("dapui").toggle() end, desc = "Toggle UI", },
    --{ "<leader>db", function() require("dap").step_back() end, desc = "Step Back", },
    --{ "<leader>dc", function() require("dap").continue() end, desc = "Continue", },
    --{ "<leader>dd", function() require("dap").disconnect() end, desc = "Disconnect", },
    --{ "<leader>de", function() require("dapui").eval() end, mode = {"n", "v"}, desc = "Evaluate", },
    --{ "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover Variables", },
    --{ "<leader>dS", function() require("dap.ui.widgets").scopes() end, desc = "Scopes", },
    --{ "<leader>di", function() require("dap").step_into() end, desc = "Step Into", },
    --{ "<leader>do", function() require("dap").step_over() end, desc = "Step Over", },
    --{ "<leader>dp", function() require("dap").pause.toggle() end, desc = "Pause", },
    --{ "<leader>dq", function() require("dap").close() end, desc = "Quit", },
    --{ "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL", },
    --{ "<leader>ds", function() require("dap").continue() end, desc = "Start", },
    --{ "<leader>dt", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint", },
    --{ "<leader>dx", function() require("dap").terminate() end, desc = "Terminate", },
    --{ "<leader>du", function() require("dap").step_out() end, desc = "Step Out", },


    --vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
    --vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})


    require("utils").safe_import(
      "dapui",
      function (dapui)
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"]=function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"]=function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"]=function()
          dapui.close()
        end
      end
    )

    require("utils").safe_import(
      "cmp",
      function (cmp)
        cmp.setup({
          enabled = function()
            return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                or require("cmp_dap").is_dap_buffer()
          end
        })

        cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
          sources = {
            { name = "dap" },
          },
        })

      end
    )

  require("utils").safe_import(
    "nvim-dap-virtual-text",
      function (virtual_text)
        virtual_text.setup {
            enabled = true,                        -- enable this plugin (the default)
            enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
            highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
            highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
            show_stop_reason = true,               -- show stop reason when stopped for exceptions
            commented = false,                     -- prefix virtual text with comment string
            only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
            all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
            clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
            --- A callback that determines how a variable is displayed or whether it should be omitted
            --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
            --- @param buf number
            --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
            --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
            --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
            --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
            display_callback = function(variable, buf, stackframe, node, options)
              if options.virt_text_pos == 'inline' then
                return ' = ' .. variable.value
              else
                return variable.name .. ' = ' .. variable.value
              end
            end,
            -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
            virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

            -- experimental features:
            all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
            virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
            virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                             -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
  }
    end
    )

    dap.adapters.lldb = {
      type = 'executable',
      command = 'lldb-vscode', -- adjust as needed, must be absolute path
      name = 'lldb'
    }

    dap.configurations.cpp = {
      {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/bin/Debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
      },
    }

    -- If you want to use this for Rust and C, add something like this:

  dap.configurations.c = dap.configurations.cpp



  end
)
