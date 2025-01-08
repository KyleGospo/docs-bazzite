---
authors:
  - "@nicknamenamenick"
  - "@Zeglius"
preview:
  src: "../img/rpm-ostree.png"
  contain: true
description: rpm-ostree is Fedora's enterprise tool for managing immutable operating system updates.
---

<!-- ANCHOR: METADATA -->
<!--{"url_discourse": "https://universal-blue.discourse.group/docs?topic=2642", "fetched_at": "2024-09-03 16:43:05.295995+00:00"}-->
<!-- ANCHOR_END: METADATA -->

![rpm-ostree|500x500, 30%](../img/rpm-ostree.png)

# `rpm-ostree` Overview

!!! attention

    Layering packages irresponsibly can be **destructive** and may prevent updates as well as other issues until the layered packages are uninstalled.

Install Fedora Linux packages by installing them with `rpm-ostree`.

- This is known as "layering packages" to the image.
- Layering packages will **require** a system reboot when it finishes creating the new deployment with the package(s) added to your image.
- Use this method as a **last resort** and for anything at a "system-level" only.

## Common `rpm-ostree` Terminal Commands:

```
rpm-ostree install <package>
```

Installs Fedora package(s) to the system that stay between updates, reboot to apply the installation.

```
rpm-ostree uninstall <package>
```

Uninstalls any layered packages added to the system, reboot to apply the uninstallation.

```
rpm-ostree search <package>
```

Searches for Fedora packages that can be installed.

## Installing RPM files

Fedora [Distrobox containers](/Installing_and_Managing_Software/Distrobox.md) should be used for most `.rpm` files, but sometimes they need to be installed to your host.

You can install RPM binaries **to your host** with `rpm-ostree` by entering:

```
rpm-ostree install <package>.rpm
```

You may need to copy the full path (`/path/to/rpmfile.rpm`) for it to install properly.

!!! important

    The downside of installing local RPM files outside of the Fedora repositories is updates for the specific RPM package will not apply automatically.

## How do I add/remove [COPR](https://copr.fedorainfracloud.org) repositories?

!!! warning

    It is highly advised to **not** use third-party COPR repos if possible, so be aware there are risks associated with it including broken updates until removed.

=== "Enable COPR"

    === "DNF5 (Fedora COPR)"

        ```sh
        sudo dnf5 copr enable <USER>/<PROJECT>
        ```

    === "DNF5 (repo file)"

        This method works with COPR other than Fedora's (ex.: [Docker](https://docs.docker.com/engine/install/fedora/#set-up-the-repository))

        ```sh
        sudo dnf5 config-manager addrepo --from-repofile=https://url/to/file.repo
        ```

    === "Manually"

        1. Download the .repo file and save it to `/etc/yum.repos.d/`

        2. Then install the package(s) with `rpm-ostree`

        3. Reboot

        If you experience issues updating your system due to GPG signature issues, then this can be fixed by either removing the COPR repository, or editing the file by changing `gpgcheck=1` to `gpgcheck=0` (or similar) and saving it **at your own risk**.

=== "Disable COPR"

    !!! warning "Ensure to remove any package installed with the COPR beforehand"

    === "DNF5 (Fedora COPR)"

        ```sh
        sudo dnf5 copr disable <USER>/<PROJECT>
        ```

    === "DNF5 (repo file)"

        Remove the `.repo` at `/etc/yum.repos.d/`

    === "Manually"

        Remove the `.repo` at `/etc/yum.repos.d/`

## How to restore default COPRs

```sh
# Remove all current repos
sudo rm /etc/yum.repos.d/*

# Now copy the default repo files fro /usr/etc to /etc
sudo cp /usr/etc/yum.repos.d/* /etc/yum.repos.d/
```

## **MAJOR** caveats using `rpm-ostree`

Layering packages can cause **severe consequences** including:

- Pause system updates until package(s) are uninstalled.
- Prevent rebasing to different images until package(s) are uninstalled.
- Conflict with existing packages as part of the image leading to dependency issues.
- Updates taking longer to download as you layer more packages to your system.

Layering packages are mostly intended for system-level applications, libraries, and other dependencies. It is recommended to use Flatpak, Homebrew, Distrobox containers, AppImage, etc. **before** installing software with `rpm-ostree`. Typical users should **not** be using `rpm-ostree` to install end-user graphical applications at all to avoid problems in the future. It is **highly recommended** to only layer packages when absolutely necessary especially if the application can be obtained through other methods.

## How to remove **ALL** layered packages

If you run into issues upgrading due to a layered package conflict, then either optionally uninstall the conflicted package(s) or remove all layered packages with this **command**:

```bash
rpm-ostree reset
```

## Image Information

See information about image build date, update channel, layered packages, etc. by **entering this command in a host terminal**:

```command
rpm-ostree status
```

## Additional Commmands

!!! warning

    Certain `rpm-ostree` and `ostree` commands can permanently remove deployments and cause other destructive behavior, so enter them at your own risk.

View the full range of `rpm-ostree` and `ostree` commands with the following two commands:

```
rpm-ostree help
```

```
ostree help
```

### Project Website

https://coreos.github.io/rpm-ostree/

<hr>

[**<-- Back to Installing and Managing Software on Bazzite**](./index.md)
