# signalflow-vcpkg-registry

## Consuming this registry

An example

### Updating this registry

How to update this registry to publish a new version of `signalflow`.

This assumes you have `vcpkg` installed somewhere on your system as per [https://vcpkg.io/en/getting-started.html](https://vcpkg.io/en/getting-started.html). Wherever you see `[path-to-vcpkg]/vcpkg` in this file, replace with your path, e.g. if you cloned the vcpkg repo to `~/src/vcpkg` then `[path-to-vcpkg]/vcpkg install signalflow` becomes `~/src/vcpkg/vcpkg install`.

### When Signalflow is updated

1. Copy `vcpkg.json` from the `signalflow` repo to `ports/signalflow/vcpkg.json`
2. Edit `versions/s-/signalflow.json`
    - Update `baseline` to match `version-string` in `vcpkg.json`
    - Set `port-version` to `0`
3. Edit `ports/signalflow/portfile.cmake`
    - In `vcpkg_from_github`, update `REF` to the git tag or commit hash for this version, from the `signalflow` repo
    - set `SHA512` to `0`
4. Remove the current version
    - `[path-to-vcpkg]/vcpkg remove signalflow`
5. Attempt to install (it will fail)
    - `[path-to-vcpkg]/vcpkg install signalflow --overlay-ports=./ports/signalflow`
6. In the error, find the line starting `Actual Hash :` and copy the value (without brackets).
7. Open `ports/signalflow/portfile.cmake` and replace the `0` for `SHA512` with the hash
7. Run the install command again, this time there should be no error.
    - `[path-to-vcpkg]/vcpkg install signalflow --overlay-ports=./ports/signalflow`
8. Commit (but do not push!) the changes
    - `git add ports/signalflow/portfile.cmake`
    - `git commit -m "update signalflow to <version number>"`
9. Run `git rev-parse HEAD:ports/signalflow` and copy the result.
10. Open `versions/s-/signalflow.json`
    - paste the value in for the `git-tree` property.
    - update the `version` property to match that in `ports/signalflow/vcpkg.json`
11. Ammend the previous commit with changes:
    - `git add versions/s-/signalflow.json`
    - `git commit --amend`
12. Push the changes to the registry
    - `git push`
13. Update any projects that depend on this registry
    - In their `vcpkg-configuration.json` file update `baseline` to be the hash of this repo's most recent commit (run `git log` to find it)

### When only the vcpkg port is updated

If the `signalflow` repo hasn't changed, but changes are made to `ports/signalflow/portfile.cmake`, then `versions/s-/signalflow.json` needs to have the `port-version` property incremented by.
