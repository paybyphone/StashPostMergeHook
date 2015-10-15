# StashPostMergeHook

## Prerequisites 

### 1 - .gitmodules setup correctly 
For this hook to work as intended make sure your submodule inside `.gitmodules` is set to track a stable/develop/main branch.


For instance:

```
[submodule "submodule1"]
        path = submodule1
        url = ssh://git@stash.dc0.verrus.net/~mfelipe/submodule1.git
        branch = develop
```

This makes my `MainProject` to have a dependency on `submodule1` and when  `git remote update --remote` is run it is going to `fetch` and point to the latest commit in the `develop` branch.

### 2 - Stash Post receive hook with `External Async Post Receive Hook` plugin

2.1 This shell script must be present at `<stash-home-dir>/external-hooks/` so the plugin can read it.

2.2 Inside `Positional parameters` provide the same branch as the tracking branch you se in the previous step


