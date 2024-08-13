# dotfiles

## INDEX

- [ABOUT](#about)
- [ENVIRONMENT](#environment)
- [PREPARING](#preparing)
- [HOW TO USE](#how-to-use)

---

## ABOUT

Manage .dotfiles.

> [!WARNING]
> DO NOT include credential info .e.g. `~/.ssh/id_rsa`, `~/.aws/credentials` etc.

---

## ENVIRONMENT

Ubuntu 22.04 LTS

---

## PREPARING

1. install this repository.

```shell
git clone RyosukeDTomita/dotfiles.git
```

2. install tmux

---

## HOW TO USE

```shell
cd dotfiles/
chmod +x initall.sh
./install.sh
```

> [!NOTE]
> Dev Containersで使用するinstall scriptはデフォルトで以下のファイルが実行される。
> - install.sh
> - install
> - bootstrap.sh
> - setup.sh
> - setup

---
