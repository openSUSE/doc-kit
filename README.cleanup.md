Separating doc-kit files from git repository
============================================

Since the doc-kit update on Nov 29, 2023, upstream-managed files were added to
`.gitignore` to separate doc-kit managed files from git. This change slightly
influences the way we work with files in a git repository.

Cleaning an existing git repository
-----------------------------------
Because many files that belong to doc-kit are unfortunately already part of git
repository as well, you need to 'clean it'. The following procedure updates a
git branch to the new doc-kit version of files and clean the git repository off
them.

1. Refresh the branch you are updating.
```
$ git pull
```

2. Run doc-kit.
```
$ doc-kit
```

3. Check the git status to see modified files.
```
$ git status
```

4. If .gitignore was modified, stage and commit it.
```
$ git add .gitignore && git commit -m 'adding updated .gitignore'
```

5. Remove doc-kit-managed files from git repository. Replace the path with your
   doc-kit checkout.
```
$ ~/devel/doc-kit/bin/clean-git-index.sh
```
6. Check the git status to see doc-kit files to be removed, for example:
```
  $ git status
  On branch main
  Your branch is up to date with 'origin/main'.

  Changes to be committed:
    (use "git restore --staged <file>..." to unstage)
    deleted:    .editorconfig
    deleted:    common/generic-entities.ent
    deleted:    common/legal.xml
    deleted:    common/license_gfdl1.2.xml
    deleted:    common/network-entities.ent
    deleted:    doc-kit.conf
    deleted:    templates/_DC-article
    deleted:    templates/articles/assembly.asm.xml
    deleted:    templates/concepts/concept.xml
    deleted:    templates/glues/glue-more-info.xml
    deleted:    templates/glues/glue-whats-next.xml
    deleted:    templates/glues/glue.xml
    deleted:    templates/images/example.png
    deleted:    templates/references/reference.xml
    deleted:    templates/snippets/snippet_warning.xml
    deleted:    templates/tasks/task.xml
    deleted:    xml/common_copyright_gfdl.xml
    deleted:    xml/generic-entities.ent
    deleted:    xml/network-entities.ent
```
7. Commit and push the changes.
```
$ git commit -am 'removing doc-kit files from git && git push'
```
  

Cloning a doc repository
------------------------
Cloning repositories is affected as well. As pure `git clone` ignores files in
`.gitignore`, many required `doc-kit` files are now missing. The following
procedure verifies that all the needed files are in place.

1. Normally clone the repo as usual.
```
$ git clone git@github.com:SUSE/doc-modular.git
```
2. Enter the repo and switch to the branch you want to start using.
```
$ cd doc-modular
$ git co tbazant-alp-installation-images
```
3. Run doc-kit and enter repo type and license
```
$ doc-kit
```
4. Check modified files and revert the ones that were overwritten accidentally.
```
$ git status
```
5. Remove untracked files that were downloaded as part of doc-kit initial run.
```
$ git -df
```