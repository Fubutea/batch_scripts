@ECHO off
:: Loop over each subdirectory
for /D %%s in (.\*) do (
	:: Echo the current subdirectory
	echo Entering Directory %%s
	:: Change current directory to the subdirectory
	cd %%s
	:: Variable expansion magic for the counter to work
	setlocal ENABLEDELAYEDEXPANSION
	:: Counter variable for unique Filename
	SET ctr=0
	:: Get name of the folder we are currently in
	SET "folder=%%~nxs"
	echo Foldername set to !folder!
	:: Loop over all files in the subdir that are a png or jpg file
	:: and rename them to just the counter variable to prevent hiccups :D
	:: not the best way I assume but works muh purpose
	:: Add other extensions to the for-loop and add another if statement for 
	:: each extension
	for %%i in (*.jpg, *.png) do (
		:: check for the extension and set the filename
		if "%%~xi" == ".png" (
			set out_file_name="!ctr!.png"
		)
		if "%%~xi" == ".jpg" (
				set out_file_name="!ctr!.jpg"
		)
		REN "%%i" !out_file_name!
		:: Increase the counter variabel
		SET /a ctr=ctr+1		
	)
	
	echo All pictures set to counter variable
	pause
	
	SET ctr=0
	:: Loop over all files in the subdir that are a png or jpg file
	:: and rename them as "parentfolder_counter.extension"
	:: Add other extensions to the for-loop and add another if statement for
	:: each extension :D, not the best script but it do work :ahuhe:
	for %%i in (*.jpg, *.png) do (
		:: check for the extension and set the filename
		if "%%~xi" == ".png" (
			if NOT "%%~xi" == "!folder!_!ctr!.png" (
				set out_file_name="!folder!_!ctr!.png"
				:: Rename the file
				REN "%%i" !out_file_name!
				echo renamed %%i to !out_file_name!
			)
		)
		
		if "%%~xi" == ".jpg" (
			if NOT "%%xi" == "!folder!_!ctr!.jpg" (
				set out_file_name="!folder!_!ctr!.jpg"
				:: Rename the file
				REN "%%i" !out_file_name!
				echo renamed %%i to !out_file_name!
			)
		)
		:: Increase the counter variable
		SET /a ctr=ctr+1		
	)
	echo All pictures in folder !folder! renamed.
	:: go back to the directory the batch-file is in so we can move to the 
	:: next directory on the loop's next iteration
	cd ..
)
:: so the console stays open
pause
