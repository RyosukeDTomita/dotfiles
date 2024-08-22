# dotfiles

## INDEX

- [ABOUT](#about)
- [ENVIRONMENT](#environment)
- [PREPARING](#preparing)
- [HOW TO USE](#how-to-use)
- [MEMO](#memo)

---

## ABOUT

Manage .dotfiles.

> [!NOTE]
> I decided to use [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode) from 2024/08/22.
> This is the [archive](https://github.com/RyosukeDTomita/dotfiles/tree/archive/before-ohmyzsh) of before using ohmyzsh.

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

> [!NOTE]
> Dev Containersかどうかを`REMOTE_CONTAINERS=true`の環境変数で識別している。参考: [GitHub issue](https://github.com/microsoft/vscode-remote-release/issues/3517)

---

## MEMO

- Dev Containersかどうかを`REMOTE_CONTAINERS=true`の環境変数で識別している。参考: [GitHub issue](https://github.com/microsoft/vscode-remote-release/issues/3517)
- [nvimのバージョンを上げたらvim-lspのエラーがでるようになった話](https://x.com/sigma5736394841/status/1826319333402042729)
