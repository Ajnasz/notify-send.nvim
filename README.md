# Notify-Send Neovim Plugin

This plugin serves as a wrapper for the `notify-send` command, enabling you to send system notifications from Neovim using `vim.notify()`.

## Installation

You can install the plugin using your preferred Neovim package manager. Here is an example using `vim-plug`:

```vim
Plug 'Ajnasz/notify-send.nvim'
```

Don't forget to run `:PlugInstall` to actually install the plugin.

## Configuration

Calling the setup function is optional.

```lua
require('notify-send').setup({opts})
```

This function is used to configure the notification settings. It takes an optional table as an argument, which can be used to override the default configuration.

Available options:
- 'command' (`string`?): Path to the notify-send command
- 'icon' (`string`?): The path to the icon file to be used in the notifications. If not set, the default icon (neovim) will be used.
- 'app_name' (`string`?) If not set, "Neovim" will be used
- 'hint' (`string`?) If not set, 'string:desktop-entry:nvim' will be used
- 'override_vim_notify' (`bool`?) Set to `false` to disable setting `vim.notify` to `notify-send.send()`

Example:

```lua
require('notify-send').setup({icon = "/path/to/your/icon.png"})
```

## Functions

### notify_send.send({msg}, {level}, {opts})

This function is used to send system notifications. It takes two arguments: a message string and a log level. The log level determines the urgency of the notification.

Parameters:
- {msg}   (`string`) Content of the notification to show to the user.
- {level} (`integer?`) One of the values from |vim.log.levels|.
- {opts} (`table`?): A table of options for the notification. It can include 'icon', 'app_name' and 'hint'.

Example:

```lua
vim.notify("Hello world", vim.log.levels.INFO)
vim.notify("Hello, World!", vim.log.levels.INFO, {
  icon = "nvim",
  app_name = "Neovim",
  hint = "string:desktop-entry:nvim",
})
```

