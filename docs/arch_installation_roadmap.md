# Roadmap: Arch Linux Installation (Hyprland / Wayland)

This guide outlines the installation of a pure Arch Linux base with a keyboard-driven tiling window manager (**Hyprland**), built around minimal dependencies and the **Royal Sheikah** visual identity for development and daily productivity.

## 0. System Summary

- **Base OS:** Arch Linux (UEFI Dual-boot with Windows)
- **GPU:** NVIDIA RTX 5070 (`nvidia-open` drivers + 32/64-bit Vulkan)
- **Audio:** PipeWire (`pipewire-pulse`, `pipewire-jack`, `wireplumber`, `wiremix`)
- **Compositor:** Hyprland (Wayland), configured in Lua (`hyprland.lua`)
- **Core Stack:** Kitty (Terminal), Fuzzel (Launcher & dmenu), Waybar (Status Bar), Yazi (File Manager), Zathura (PDF Viewer), Satty + Grim + Slurp (Screenshots), Cliphist (Clipboard History), Bluetui (Bluetooth TUI), Hyprpolkitagent (Authentication), Wiremix (Audio TUI).

> **Laptop-Specific Adjustments:**
>
> - Replace `amd-ucode` with `intel-ucode` on Intel CPUs.
> - Replace `nvidia-open` with `mesa vulkan-intel` (or `vulkan-radeon`) if no discrete NVIDIA GPU is present.
> - Add `power-profiles-daemon` in Phase 4 for battery profile management.

---

## Phase 1: Preparation and Partitioning

1. **Create the bootable USB drive:**

   ```bash
   sudo dd if=archlinux-x86_64.iso of=/dev/sdX bs=4M status=progress oflag=sync
   ```

2. **BIOS & Windows Prerequisites:**
   - Disable **Secure Boot** in the UEFI/BIOS settings.
   - Disable **Fast Startup** in Windows Power Options.

3. **Boot from USB (UEFI mode):**
   - Connect to Wi-Fi (if needed): `iwctl station wlan0 connect "SSID_Name"`
   - Verify internet connectivity: `ping archlinux.org`

4. **Disk Partitioning (`lsblk -f` to identify drives):**
   - `fdisk /dev/nvme0n1`
   - Keep the existing Windows EFI System Partition (`FAT32`).
   - Create a new Linux Root partition (`ext4`).
   - Format the Root partition: `mkfs.ext4 /dev/nvme0n1pX`

5. **Mount Partitions:**

   ```bash
   mount /dev/nvme0n1pX /mnt
   mount --mkdir /dev/nvme0n1pY /mnt/boot/efi  # pY = Windows EFI partition
   ```

---

## Phase 2: Base System and Configuration

1. **Install the minimal base system:**

   ```bash
   pacstrap -K /mnt base linux linux-firmware amd-ucode nano sudo
   ```

2. **Generate `fstab`:**

   ```bash
   genfstab -U /mnt >> /mnt/etc/fstab
   ```

3. **Enter the new system (Chroot):**

   ```bash
   arch-chroot /mnt
   ```

4. **Localization and Timezone:**

   ```bash
   ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
   hwclock --systohc
   systemctl enable systemd-timesyncd
   nano /etc/locale.gen              # Uncomment en_US.UTF-8 (and fr_FR.UTF-8 if needed)
   locale-gen
   echo "LANG=en_US.UTF-8" > /etc/locale.conf
   ```

5. **Network Setup:**

   ```bash
   echo "archlinux" > /etc/hostname
   pacman -S networkmanager
   systemctl enable NetworkManager
   ```

6. **User Account and Sudo Privileges:**

   ```bash
   passwd                           # Set root password
   useradd -m -G wheel -s /bin/bash username
   passwd username                  # Set user password
   EDITOR=nano visudo               # Uncomment: %wheel ALL=(ALL:ALL) ALL
   ```

---

## Phase 3: Graphics Drivers and Bootloader (GRUB)

1. **Enable the 32-bit Repository (`multilib`) _(Optional — keep ready for future 32-bit workloads)_:**
   - Open `nano /etc/pacman.conf`.
   - Uncomment both `[multilib]` and its `Include` line.
   - Synchronize package databases: `pacman -Sy`.

2. **Install NVIDIA Open Kernel Modules & Vulkan Loaders:**

   ```bash
   pacman -S nvidia-open nvidia-utils lib32-nvidia-utils vulkan-icd-loader lib32-vulkan-icd-loader
   ```

3. **Install GRUB and OS-Prober (Windows Dual-boot detection):**

   ```bash
   pacman -S grub efibootmgr os-prober
   ```

4. **Configure GRUB (`nano /etc/default/grub`):**
   - Append `nvidia_drm.modeset=1` to `GRUB_CMDLINE_LINUX_DEFAULT`.
   - Uncomment `GRUB_DISABLE_OS_PROBER=false`.

5. **Install and Generate GRUB Config:**

   ```bash
   grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --recheck
   grub-mkconfig -o /boot/grub/grub.cfg
   ```

6. **Exit and Reboot:**

   ```bash
   exit
   umount -R /mnt
   reboot
   # Remove the USB drive once the system powers off.
   ```

---

## Phase 4: Graphical Stack and Minimalist Tooling (From TTY)

1. **Audio & Build Essentials:**

   ```bash
   sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber wiremix base-devel git
   ```

2. **System Fonts:**

   ```bash
   sudo pacman -S noto-fonts noto-fonts-emoji ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono
   fc-cache -fv
   ```

3. **Hyprland Desktop & Wayland Utilities:**

   ```bash
   sudo pacman -S hyprland hyprpaper kitty waybar fuzzel hyprpolkitagent xdg-desktop-portal-hyprland xdg-utils dunst libnotify
   ```

4. **Screenshots, Clipboard & Bluetooth (Official Repos Only):**

   ```bash
   sudo pacman -S grim slurp satty cliphist wl-clipboard bluez bluez-utils bluetui upower
   sudo systemctl enable --now bluetooth
   ```

5. **Terminal, PDF Viewer & Dotfiles Tooling:**

   ```bash
   sudo pacman -S yazi zathura zathura-pdf-mupdf btop bat eza fastfetch openssh fnm ffmpegthumbnailer 7zip jq poppler fd ripgrep fzf zoxide imagemagick stow starship less
   xdg-mime default org.pwmt.zathura.desktop application/pdf
   ```

6. **Install AUR Helper (`yay`) _(Optional — for packages not in official repos)_:**

   ```bash
   git clone https://aur.archlinux.org/yay.git
   cd yay && makepkg -si && cd .. && rm -rf yay
   ```

   - _Tip:_ Set `!debug` in `OPTIONS=(...)` inside `/etc/makepkg.conf` to prevent `makepkg` from generating `*-debug` packages.

---

## Phase 5: Hyprland Bootstrap (Lua)

1. **Verify `~/.config/hypr/hyprland.lua` & modular configs (`config/`):**
   - **Base:** Remove `autogenerated = true`.
   - **Keyboard & Core Programs (`config/programs.lua`):**

     ```lua
     terminal    = "kitty",
     fileManager = "kitty -e yazi",
     menu        = "fuzzel",
     bluetooth   = "kitty --class bluetooth-tui -e bluetui",
     audio       = "kitty --class audio-tui -e wiremix"
     ```

   - **NVIDIA Environment (`config/environment.lua`):**

     ```lua
     hl.env("LIBVA_DRIVER_NAME", "nvidia")
     hl.env("XDG_SESSION_TYPE", "wayland")
     hl.env("GBM_BACKEND", "nvidia-drm")
     hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
     hl.config({ cursor = { no_hardware_cursors = true } })
     ```

   - **Autostart Daemons (`config/autostart.lua`):**

     ```lua
     hl.on("hyprland.start", function()
         hl.exec_cmd("waybar & hyprpaper")
         hl.exec_cmd("systemctl --user start hyprpolkitagent")
         hl.exec_cmd("wl-paste --type text --watch cliphist store")
         hl.exec_cmd("wl-paste --type image --watch cliphist store")
     end)
     ```

2. **Start the Graphical Session:**

   ```bash
   start-hyprland
   ```

---

## Phase 6: Dotfiles Deployment (Royal Sheikah)

Once inside Hyprland, deploy the **Royal Sheikah** configurations across all modules:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/znejnah/dotfiles.git ~/dotfiles
   ```

2. **Create the screenshots directory and hide Zathura from Fuzzel launcher:**

   ```bash
   mkdir -p ~/Pictures/Screenshots ~/.local/share/applications
   cp /usr/share/applications/org.pwmt.zathura.desktop ~/.local/share/applications/
   echo "NoDisplay=true" >> ~/.local/share/applications/org.pwmt.zathura.desktop
   ```

3. **Symlink all packages with GNU Stow:**

   ```bash
   cd ~/dotfiles
   stow */
   ```
