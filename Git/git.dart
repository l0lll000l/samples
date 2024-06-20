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
//---------------------------------------------------------------------------------------------------main operations
  git add .                                    //add all files
  git checkout a1205c264d96490b0c429015aa0bc41d1e86c94f    //detatch head
  git checkout master                          //back to normal
  git diff                                     //recently modified things will show
  git reset HEAD~2 --hard                      //remove 2 commits      
  git reset HEAD-2                             // soft reset.  files dont delete
  git reset --hard                             //delete new modifications
  git checkout HEAD -f                         //delete new modifications
  git checkout home.dart                       //delete new modifications of a file
  git restore home.dart                        //delete new modifications of a file
//----------------------------------------------------------------------------------------------------branch
  git branch                                   //show all branches
  git branch myFeature                         //create new branch named myFeature
  git branch -M main                           //change branch name
  git checkout myFeature                       //change head to myFeature
  git checkout master                          //change head to master
  git log myFeature 
  git cherry-pick  95955e23cd768555e3a6b04aeba9eed30036e1df //copy commit id that want to be move from myfeature to master
  git merge myFeature                          //merge two branch .if (error) remove code and commit
  git branch -d myFeature                      //delete branch
  git branch -D myFeature                      //delete branch
  //--------------------------------------------------------------------------------------------------collaboration
  git clone ../Git/                            //go to another directory
  git remote -v                                //to know git cloned from which repository
  git branch -a                                //show all branches
  git branch -vv                               //show last change
  git fetch                                    //fetch data from server
  git merge                                    //save changed data to local branch 
  git pull                                     //execute git fetch and git merge 
  git push                                     //git push newest data from local branch to test branch
  git diff master test                         //check difference
  git merge test                               //merge two branches
  //----------------------------------------------------------------------------------------------------
