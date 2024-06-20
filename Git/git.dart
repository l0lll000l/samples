git init                                       //initialize git
git add main.dart                              //add file
git commit                                     //add message , ESC :wq        to save
git status                                     //Changes to be committed:
                                               // (use "git rm --cached <file>..." to unstage)
                                               //new file:   main.dart

git commit                                     //[master (root-commit) bc83faf] create main.dart
                                               // 1 file changed, 0 insertions(+), 0 deletions(-)
                                               //create mode 100644 main.dart
//-----------------------------------------------------------------------------------------------------------------
  git add main.dart                            //add file
  git status                                   //status check
  git commit -m 'print'                        //message add
  git log                                      // print previous logs
//---------------------------------------------------------------------------------------------------
  git add .                                    //add all files
  git checkout a1205c264d96490b0c429015aa0bc41d1e86c94f    //detatch head
  git checkout master                          //back to normal
  git diff                                     //recently modified things will show
  git reset HEAD~2 --hard                      //remove 2 commits      
  git reset HEAD-2                             // soft reset.  files dont delete
  git reset --hard                             //delete new modifications
  git checkout HEAD -f                         //delete new modifications
