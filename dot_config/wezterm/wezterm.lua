local wezterm                       = require 'wezterm'

local config                        = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity    = 0.7
config.macos_window_background_blur = 10
config.initial_cols                 = 150
config.initial_rows                 = 40

config.font                         = wezterm.font('Cascadia Code')
config.font_size                    = 12
config.enable_scroll_bar            = false
config.use_fancy_tab_bar            = false
config.tab_bar_at_bottom            = true
config.window_decorations           = 'RESIZE'
config.default_cursor_style         = 'BlinkingBlock'
local act                           = wezterm.action

local mod                           = {
    SUPER = "SUPER",
    SUPER_REV = 'SUPER|SHIFT',
    OPT = 'OPT',
}

config.leader                       = { key = 'a', mods = 'CTRL' }
config.mouse_bindings               = {
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = mod.SUPER,
        action = act.OpenLinkAtMouseCursor,
    },
}
config.key_tables                   = {
    resize_pane = {
        { key = 'k',      action = act.AdjustPaneSize({ 'Up', 1 }) },
        { key = 'j',      action = act.AdjustPaneSize({ 'Down', 1 }) },
        { key = 'h',      action = act.AdjustPaneSize({ 'Left', 1 }) },
        { key = 'l',      action = act.AdjustPaneSize({ 'Right', 1 }) },
        { key = 'Escape', action = 'PopKeyTable' },
        { key = 'q',      action = 'PopKeyTable' },
    },
}

config.keys                         = {
    -- panes: split panes
    {
        key = [[\]],
        mods = mod.SUPER,
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = [[\]],
        mods = mod.SUPER_REV,
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },


    -- panes: zoom+close pane
    { key = 'Enter', mods = mod.SUPER, action = act.TogglePaneZoomState },
    { key = 'w',     mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },

    -- panes: navigation
    { key = 'k',     mods = 'LEADER',  action = act.ActivatePaneDirection('Up') },
    { key = 'j',     mods = 'LEADER',  action = act.ActivatePaneDirection('Down') },
    { key = 'h',     mods = 'LEADER',  action = act.ActivatePaneDirection('Left') },
    { key = 'l',     mods = 'LEADER',  action = act.ActivatePaneDirection('Right') },

    -- panes: resize_pane
    {
        key = 'p',
        mods = 'LEADER',
        action = act.ActivateKeyTable({
            name = 'resize_pane',
            one_shot = false,
            timemout_miliseconds = 1000,
        }),
    },

    {
        key = 'p',
        mods = mod.SUPER,
        action = act.ActivateCommandPalette
    },
    {
        key = 'u',
        mods = mod.SUPER,
        action = wezterm.action.QuickSelectArgs({
            label = 'open url',
            patterns = {
                '\\((https?://\\S+)\\)',
                '\\[(https?://\\S+)\\]',
                '\\{(https?://\\S+)\\}',
                '<(https?://\\S+)>',
                '\\bhttps?://\\S+[)/a-zA-Z0-9-]+'
            },
            action = wezterm.action_callback(function(window, pane)
                local url = window:get_selection_text_for_pane(pane)
                wezterm.log_info('opening: ' .. url)
                wezterm.open_with(url)
            end),
        }),
    },

    -- tabs: navigation
    { key = '[', mods = mod.SUPER,     action = act.ActivateTabRelative(-1) },
    { key = ']', mods = mod.SUPER,     action = act.ActivateTabRelative(1) },
    { key = '[', mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
    { key = ']', mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

    {
        key = ',',
        mods = mod.OPT,
        action = wezterm.action_callback(function(window, pane)

            local wez_config_path = os.getenv('HOME') .. '/.config/wezterm/wezterm.lua'
            wezterm.log_info('wez config' .. wez_config_path)
            window:perform_action(
                wezterm.action.SpawnCommandInNewTab {
                    args = { 'nvim', wez_config_path },
                    set_environment_variables = {
                        PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
                    },
                },
                pane
            )
        end),
    },

    -- copy mode
    { key = 'Enter', mods = mod.SUPER_REV, action = 'ActivateCopyMode' },
}

return config
