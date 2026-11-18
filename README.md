# homebrew-tap

```sh
brew install --cask ahmedash95/tap/rapidsnap
brew install --cask ahmedash95/tap/toma
brew install --cask ahmedash95/tap/readfast
```

`Casks/rapidsnap.rb` is bumped automatically by the release workflow in
[ahmedash95/rapidsnap](https://github.com/ahmedash95/rapidsnap) on every `vX.Y.Z` tag.

`Casks/toma.rb` is bumped automatically by the release workflow in
[ahmedash95/toma](https://github.com/ahmedash95/toma) on every `vX.Y.Z` tag when
`HOMEBREW_TAP_TOKEN` is configured on that repository.

`Casks/readfast.rb` is written automatically by the release workflow in
[ahmedash95/readfast](https://github.com/ahmedash95/readfast) on every push to `main`
when `HOMEBREW_TAP_TOKEN` is configured on that repository.
