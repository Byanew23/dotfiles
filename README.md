# Repo with my basic configurations

## To use you need `stow` in order to link all the files

1. Remove the README.md file (otherwise stow will complain)

```sh
rm README.md
```

2. install `stow`

3. Link all the configs

```sh
stow --adopt -vt ~ *
```

> Note: use the `-nvt` flags first to see the example output before commiting to linking your config files

4. Enjoy
