# Telegram messenger for Debian

![update repository](https://github.com/ad-m/telegram-repository/workflows/update%20repository/badge.svg)

The repository contains information about creating package of Telegram messenger and provides the APT repository
that delivery the current version of package. 

Debian package repository automate installation and upgrade of Telegram messenger. 

## Usage

To use this repository, first
add the key to your system:

```bash
wget -q -O - https://ad-m.github.io/telegram-repository/publickey.txt | sudo apt-key add -
```

Then add the following entry in your `/etc/apt/sources.list.d/telegram.list`:

```apt
deb https://ad-m.github.io/telegram-repository/ ./
```

You can use following command for that:

```bash
echo "deb https://ad-m.github.io/telegram-repository/ ./" >> /etc/apt/sources.list.d/telegram.list
```

Update your local package index, then finally install Telegram:

```bash
sudo apt-get update  
sudo apt-get install telegram
```

See [https://desktop.telegram.org/](https://desktop.telegram.org/) for more information about Telegram messenger.
