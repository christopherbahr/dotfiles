#My Fantastic Dotfiles
###Vimrc (The most important)

####Unix
To get this set up on linux clone the repository. Symlink ~/.vimrc to dotfiles/.vimrc. Clone NeoBundle and follow the instructions there to get that setup. Then launch vim, let it clone all of the plugins. Navigate to YouCompleteMe and run the install script. 

####Windows

#####Prerequisites
Vim 7.4 compiled with python support
python (for YCM)

#####Now let's get it working

Note the following is a work in progress as I try to get this working on my work Win 7 computer. The following sholud be pretty good for starters. 

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
