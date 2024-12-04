# Changes

## 0.15.23

- Replaced sed patch with actual patchfile, hopefully makes it easier to notice if it breaks

## 0.15.19

- Intial packaging
- Patched `packages/agent_cli/src/playit_secret.rs#L31`:

```diff
-        let config_path = dirs::config_local_dir();
+        let config_path = match std::env::var_os("XDG_CONFIG_HOME") { Some(v) => Some(std::path::PathBuf::from(v)), None => dirs::config_local_dir() };
```

Use $XDG_CONFIG_HOME if set, for Cygwin and MSYS2 users.
