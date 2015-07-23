#These are notes to the Chapter 2 & 3 on Lynda.com

#pwd - Present Working directory
#ls - Shows a list
#ls -l Different kind of listing (permissions, size, etc.)
#ls -la Shows parent directories and hidden files
#ls -lah Shows the size of the files
#cd Changes directory
#cd .. Goes to the parent of the current directory
#Tab will autocomplete what you're typing
#cd/ defines the root
#cd ~ will take you back to your use directory
#cd - toggles from your last directory and your current directory


#Naming Files
#Maximum of 255 characters
#Avoid \/*&%? symbols
#Use A-Z, 0-9
#Stick to lowercase
#'myfile' is different from 'MyFile'
#Underscores are better than spaces
#if you have a space you can indicate the name of the file with ""
#touch creates a file, if it can't find the file
#ed - earliest text editor
#vi was later improved into vim
#pico was later improved into nano
#nano - text editor used now
#http://www.nano-editor.org
#cat will concatenate a file or files together
#more - paginated output / only move forward not backward
#less - let's you move backward
#less and more are confusing lol
#man - manual
#head - displays lines from beginning of a file
#tail - display lines from end of a file
#tail -f "Follow" the tail of a file
#mkdir testdir - will create a directory named testdir
#mdir testdir/test1 will make two directories
#mkdir -p testdir/test1/test2 will make three
#mv - move file
#rm remove file
#use mv to rename a file while you move it
#-n = no overwriting
#-f = force overwriting
#-i = interactive overwriting, "ask me"
#-v = verbose
#by default move will overwrite files
#cp - copy files
#When you delete a file in Unix it deletes it forever
#rm - remove a file
#command + L = make alias
	#it will act as if you are opening the original file
	#alias will break if the original file is deleted
	#The files are big because the information stored is finder finding where the original file is
	#In unix alias is useless
#hard links = ln filetolink hardlink
	#do not break if file is moved or deleted (hard link)
	#hard links will be the same size as the original file
#sym link - symbolic link
	#ln -s filetolink symlink
	#reference the path to the file
	#break if file is moved or deleted
#find path expression
#find ~/Documents -name "someimage.jpg"
#* = zero or more characters(glob)
#? = any one character
#[] = any character in the brackets

