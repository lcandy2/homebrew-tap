# lcandy2/tap

Homebrew formulas by lcandy2.

```sh
brew install lcandy2/tap/sim-agentation
```

| Formula | What it is |
|---|---|
| [`sim-agentation`](Formula/sim-agentation.rb) | [SimAgentation](https://github.com/lcandy2/sim-agentation): annotate a running iOS simulator in the browser and hand the notes to coding agents |

## Updating a formula from a release

A project's release workflow calls [`bump.yml`](.github/workflows/bump.yml) with the formula's name and the new download. It writes here as the "lcandy2's homebrew tap" GitHub App, with a token minted for that run and scoped to this repository, so no long-lived credential with write access sits anywhere:

```yaml
tap:
  uses: lcandy2/homebrew-tap/.github/workflows/bump.yml@main
  with:
    formula: sim-agentation
    url: https://github.com/lcandy2/sim-agentation/releases/download/0.2.2/sim-agentation-0.2.2-macos-arm64.tar.gz
  secrets:
    app-private-key: ${{ secrets.HOMEBREW_TAP_APP_PRIVATE_KEY }}
```

The calling repository keeps the app's private key as `HOMEBREW_TAP_APP_PRIVATE_KEY`; the key lives in 1Password.
