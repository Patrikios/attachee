# attachee
Like `library()` but streamlined. 

Grabs (from library paths or otherwise tries to install) and attaches a package.

A POC package `attachee` works like `library()` but tries to intall the given package(s) if no found on path. Its flagship function is 'grab_and_attach' that is inteded to get deloped towards a friendly attitude for behind the firewal - company context - installs.

In order to attach the whole list of packages in one command, you can do:

    grab_and_attach(this_is_error, "again_error", data.table, "lubridate")
    
Outputs:

![grafik](https://user-images.githubusercontent.com/11005155/164988963-7bcef978-f881-4c39-8f50-ee801b752b61.png)

    
It will ignore packages that cannot be fetched from the given mirror and continue with loading and isntalling with those that can be determined.
    
If `cli` package is installed will give coloured outputs, otherewise `cat` is used for messages.


Works on string values as well as with non-standard evaluation of values.

Use with caution, as mentioned it is a POC in very early stage.
