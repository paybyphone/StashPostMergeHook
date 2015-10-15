# StashPostMergeHook
For this hook to work as intended make sure your submodule inside `.gitmodules` is set to track a stable/develop/main branch.


For instance:

```
[submodule "submodule1"]
        path = submodule1
        url = ssh://git@stash.dc0.verrus.net/~mfelipe/submodule1.git
        branch = develop
```

This makes my `MainProject` to have a dependency on `submodule1` and when  `git remote update --remote` is run it is going to `fetch` and point to the latest commit in the `develop` branch.
