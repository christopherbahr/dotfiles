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

Step 2: Install the github windows client here https://windows.github.com/. I think this will make it much easier so you don't have to fight with ssh keys although I didn't actually do it this way. (Update: the client totally refused to sync for me... maybe it will work better if you start by using the client. I'm not sure but I had to do it over https and authenticate every time).

Step 3: Clone the NeoBundle repository into C:\Program Files (x86)\Vim\vimfiles\bundle (you'll have to create that directory). 

Step 4: Clone this repository into your user folder and symlink the vimrc
```
cd "C:\Program Files (x86)\Vim\"
rm _vimrc
mklink _vimrc "%UserProfile\dotfiles\.vimrc"
```

Step 4: Launch vim, ignore the friendly error messages, and tell NeoBundle to install all the stuff.

Step 5: Relauch vim and revel in your success

Step 6: Get a patched font working so that airline will be pretty.

Step 7: Get YCM working.

#####Airline Special Characters
Airline is set to use the powerline symbols which means that we'll have to get a font that has them. I use consolas on windows and there is a patched version here https://github.com/nicolalamacchia/powerline-consolas which overwrites the system font to add the special symbols. All you have to do is download the ttf and install it and it should work great.

#####YCM
YCM isn't officially supported on Windows but there is a "Windows install guide". The easy way is to go here https://bitbucket.org/Haroogan/vim-youcompleteme-for-windows/src and follow the instructions.

If you don't have LLVM just use the one from Haroogan too. Unzip the download and add the bin folder to the PATH so windows can find libclang.dll. (This will also give you the abilitiy to compile from the windows command line which may be nice or may break everything you've worked for that isn't Vim... proceed with caution).

Note: It is important that python, vim, llvm, and YCM all either be 32 or 64 bit or it won't work.
