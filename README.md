# Repo with my basic configurations

## To use you need `stow` in order to link all the files

1. Remove the README.md file (otherwise stow will complain)

```sh
rm README.md
```

2. install `stow`

3. Link all the configs

```sh
stow -vt ~ *
```

> Note: use the `-nvt` flags first to see the example output before commiting to linking your config files

> Note: if `stow` have conflicts because of empty unadopted files, use the `--adopt` flag to adopt and use the files as they are

4. Enjoy
