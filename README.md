#My Fantastic Dotfiles
###Vimrc (The most important)

####Unix
To get this set up on linux clone the repository. Symlink ~/.vimrc to dotfiles/.vimrc. Clone NeoBundle and follow the instructions there to get that setup. Then launch vim, let it clone all of the plugins. Navigate to YouCompleteMe and run the install script. 

####Windows

Note the following is a work in progress as I try to get this working on my work Win 7 computer.

Getting it working on Windows is a bit more of an adventure. First off where Vim will be installed is a bit of a mystery. Last I checked it put itself in C:\Program Files (x86)\Vim. Step one is go take ownership of that folder and give your user full permissions on the folder. This will minimize the horrible pain that Windows will put you through. Next make sure git is installed. They have a very nice installer here http://git-scm.com/download/win. Make sure to install it such that git is added to the PATH variable so you can type git in the (windows) command line and it will do something useful. Now try to clone NeoBundle. When I tried to do it last time it failed miserably and I had to download it as a zip. Anyways get that into a vimfiles\bundle\neobundle.vim folder and you should be good to go. Now launch vim and let it download everything. Relaunch vim and revel in your success. Now try to figure out how to get YCM to compile and run on windows.
