(fn get-urgency [level]
  (let [levels (. vim.log :levels)]
    (match level
      levels.DEBUG "low"
      levels.INFO "normal"
      levels.WARN "normal"
      levels.ERROR "critical"
      levels.TRACE "low"
      _ "normal"
      )
    )
  )

(local config
  {
   :command "notify-send"
   :icon "nvim"
   :app_name "Neovim"
   :hint "string:desktop-entry:nvim"
   :override_vim_notify true
   })

(fn on-cmd-exit [opts] (when (not (= 0 (. opts :code))) (error opts.stderr)))

(fn send [msg level opts]
  (when (not (= level vim.log.levels.OFF))
    (vim.system
      [
       (or (?. opts :command) (. config :command)) msg
       "--urgency" (get-urgency level)
       "--icon" (or (?. opts :icon) (. config :icon))
       "--app-name" (or (?. opts :app_name) (. config :app_name))
       "--hint" (or (?. opts :hint) (. config :hint))
       ] { :text true } on-cmd-exit)
    true
    ))

(fn setup [opts]
  (vim.tbl_extend :force config (or opts {}))
  (when (. config :override_vim_notify) (tset vim :notify send))
  )
{ :send send :setup setup }
