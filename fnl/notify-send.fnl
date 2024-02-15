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
   })


(fn send [msg level opts]
  (when (not (= level vim.log.levels.OFF))
    (vim.system
      [
       (or (?. opts :command) (. config :command)) msg
       "--urgency" (get-urgency level)
       "--icon" (or (?. opts :icon) (. config :icon))
       "--app-name" (or (?. opts :app_name) (. config :app_name))
       "--hint" (or (?. opts :hint) (. config :hint))
       ])
    true
    ))

(fn setup [opts] (vim.extend config opts))
{ :send send :setup setup }
