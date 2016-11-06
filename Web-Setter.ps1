
$document_dir = ($Home + "\Documents\");

$project_loc_user = read-host '__where you want Web-Setter to execute under "Documents"  '
$project_loc_final = ($document_dir+$project_loc_user);


if(test-path $project_loc_final)
{
    set-location $project_loc_final;

	$project_dir = read-host '__provide Project Dir name ';

    if(!(test-path $project_dir))
    {
		.{
			#create all dirs
	        new-item -type directory -force -path ($project_dir);

			set-location $project_dir;

	        new-item -type directory -force -path ('css');
	        new-item -type directory -force -path ('js');
	        new-item -type directory -force -path ('dist');
	        new-item -type directory -force -path ('dist\js');
	        new-item -type directory -force -path ('dist\css');

			#create all files
			new-item -type file -force -path ('index.html');
			new-item -type file -force -path ('css\main.css');
			new-item -type file -force -path ('css\main.sass');
			new-item -type file -force -path ('js\main.js');
			new-item -type file -force -path ('dist\css\bundle.css');
			new-item -type file -force -path ('dist\js\bundle.js');
		} | out-null;

		atom .;
		write-host ('SUCCESS! Dir '+$project_dir+' created in '+ (get-location));

    }else{
        write-host ('Dir already there or flaut going in');
    }
}else{
	write-host ('Flase Dir under "' + $document_dir +'"');
}
