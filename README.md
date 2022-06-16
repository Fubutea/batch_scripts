# batch_scripts
Batch-scripts to make life a little easier.

Dumpster for useful (useless) scripts to run on windows.

## rename_images.bat:

Assume you have a folder */pictures/* with several sub-folders like *pictures/animals/*, *pictures/tea/*, *pictures/holiday/*. 
Drop the script in the folder *pictures* and let it do the magic.
It renames each item that's either a *png* or *jpeg* to "parentfolder_counter", e.g. animals_1.png, animals_2.jpg and so on.
Not particularly interesting unless you have many images to handle and like it to be tidy :D

It should be easy to add other extensions as well if you look at the "code" if you can call it that.
Sadly I couldn't figure out how to the thing recursively yet D:, so you are limited to one folder level.
