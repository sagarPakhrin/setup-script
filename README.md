setup-script
============

This is the script I run after a fresh linux install on my desktop.

Steps
-----

1. The setup of my desktop is one hard drive for operating systems and one for data. At any given time I usually have one linux partition and a windows partition along with some free space. Install the new version of linux to the free space and then grow the partition after I'm happy with the new setup. This lets me copy old config over directly in addition to this script.

2. Download the script and run it. Rememeber that it requires an enter press to continue with each step. I usually take a second to update the versions of some of the items as well.

3. Change the default shell to `zsh`. The only way I've found to do this is to edit the termial profile using the menu and choosing run a custom command instead of my shell and setting it to `zsh`

4. Add data hard drive to `/etc/fstab`. There is a script to do this in the root dir of the drive.

5. After mounting data I've been adding it as a bookmark in the file browser and removed the other default bookmarks (pictures, videos etc). I also add my dropbox folder.

6. Mount the old linux install and copy over some directories. I typically move:
  * `.themes`
  * `.ssh`

7. [Install numix-icon-theme-circle](http://me4oslav.deviantart.com/art/Numix-Circle-Linux-Desktop-Icon-Theme-414741466)
  
8. Open Cinnamon settings and:
  * set the theme (window: gnome-cupertino, icons: numix circle, controls: mint x aqua)

9. Login to chrome and login to all the things.

10. Install keeweb
