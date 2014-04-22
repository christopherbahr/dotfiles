#My Fantastic Dotfiles
###Vimrc (The most important)

####Unix
To get this set up on linux clone the repository. Symlink ~/.vimrc to dotfiles/.vimrc. Clone NeoBundle and follow the instructions there to get that setup. Then launch vim, let it clone all of the plugins. Navigate to YouCompleteMe and run the install script. 

####Windows

#####Prerequisites
Vim 7.4 compiled with python support
python (for YCM)

Note the following is a work in progress as I try to get this working on my work Win 7 computer.

Getting it working on Windows is a bit more of an adventure. First off where Vim will be installed is a bit of a mystery. Last I checked it put itself in C:\Program Files (x86)\Vim. Step one is go take ownership of that folder and give your user full permissions on the folder. This will minimize the horrible pain that Windows will put you through. Next make sure git is installed. They have a very nice installer here http://git-scm.com/download/win. Make sure to install it such that git is added to the PATH variable so you can type git in the (windows) command line and it will do something useful. Now try to clone NeoBundle. When I tried to do it last time it failed miserably and I had to download it as a zip. Anyways get that into a vimfiles\bundle\neobundle.vim folder and you should be good to go. Now launch vim and let it download everything. Relaunch vim and revel in your success. Now try to figure out how to get YCM to compile and run on windows.

Step 0: Take ownership of the folder that Vim is installed in. This will hopefully reduce the number of windows induced headaches during this install.

Step 1: Install git from here http://git-scm.com/download/win. Make sure to install it so that the PATH variable is modified so that typing git in a cmd window will work. (Otherwise NeoBundle will be sad).

Step 2: Install the github windows client here https://windows.github.com/. I think this will make it much easier so you don't have to fight with ssh keys although I didn't actually do it this way.

Step 3: Clone the NeoBundle repository into C:\Program Files (x86)\Vim\vimfiles\bundle (you'll have to create that directory). 

Step 4: Clone this repository into your user folder and symlink the vimrc
> cd "C:\Program Files (x86)\Vim\"
> rm _vimrc
> mklink _vimrc "%UserProfile\dotfiles\.vimrc"


Step 4: Launch vim, ignore the friendly error messages, and tell NeoBundle to install all the stuff.

Step 5: Relauch vim and revel in your success

Step 6: Get a patched font working so that airline will be pretty.

Step 7: Get YCM working.

#####Unicode
Airline is set to use the powerline symbols which means that we'll have to get a font that has them. I use consolas on windows and there is a patched version here https://github.com/eugeneching/consolas-powerline-vim. Unfortunately so far it's not working. 

#####YCM
YCM is a great autocompleter but unfortunately there isn't actually support for windows. I tried it before and it failed miserably but smart people seem to have worked on it since then so maybe with their help I can get it going. 
