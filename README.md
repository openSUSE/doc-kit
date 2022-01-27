Doc-Kit
=======

* Initialize SUSE or openSUSE documentation repositories.
* Update boilerplate files contained in documentation repositories.

## What It Is

Doc-Kit consists of two parts:

* a command-line tool called `doc-kit` can download documentation boilerplate files
* a repository of documentation boilerplate files, such as the SUSE book preface and entity files

Both are currently hosted in this Git repository.

## Installing Doc-Kit

The `doc-kit` command-line tool can be installed in the following ways:

* Install it as an RPM for openSUSE from the OBS project [Documentation:Tools](https://build.opensuse.org/project/show/Documentation:Tools), under the package name `doc-kit`. (Generally preferred.)

* Clone this Git repository and use `bin/doc-kit`.


## Setting Up a Completely New Project

0. Create a new directory and switch to it.
1. Create a Git repository in the directory: `git init`. 
2. Within this directory, run `doc-kit`.
3. Specify the document type you want to create. Currently, the options are `docbook5-book` and `asciidoc-release-notes`.
4. Document types can have variants.
   This allows, for example, to ship a slightly different set of files for products that support a single architecture versus products that support multiple architectures.
   * If the selected type has variants, specify the ones needed in your situation.
   * If there are no variants, this step will be skipped.
5. Doc-Kit will now download all necessary files. At the end, it will create a settings file `doc-kit.conf`.
6. Add and commit all downloaded files to the Git repo (including the `doc-kit.conf` settings file):  `git add . && git commit`
7. Start customizing the files:
   * Doc-Kit makes a distinction between files downloaded only once during the initial setup ("initial") and files that are updateable ("always").
   * Which type of file you are looking at is noted in the first few lines of the file header.
   * Do not edit updateable files, or you will run into issues on later updates with Doc-Kit.
     (As also noted in the file header.)
   * Do edit initial files, so they fit with your project.
     Feel free to remove the file headers from initial files.
8. Make sure the edited project validates: `daps -d DC-example validate` 
9. Commit your changes again.


## Converting a Project to Using Doc-Kit

0. Go to your project directory.
1. Make sure there are no uncommitted changes and no stray unstaged files in your project directory.
2. Within this directory, run `doc-kit`.
3. Specify the document type you want to create. Currently, the options are `docbook5-book` and `docbook4-release-notes`.
4. Document types can have variants.
   This allows, for example, to ship a slightly different set of files for products that support a single architecture versus products that support multiple architectures.
   * If the selected type has variants, specify the ones needed in your situation.
   * If there are no variants, this step will be skipped.
5. Doc-Kit will now download all necessary files. At the end, it will create a settings file `doc-kit.conf`.
6. Get an overview of the unstaged new files added by Doc-Kit using `git status`.
7. Start customizing the files:
   * Doc-Kit makes a distinction between files downloaded only once during the initial setup ("initial") and files that are updateable ("always").
   * Which type of file you are looking at is noted in the first few lines of the file header.
   * Do not edit updateable files, or you will run into issues on later updates with Doc-Kit.
     (As also noted in the file header.)
   * Do edit initial files, so they fit with your project.
     Feel free to remove the file headers from initial files.
   * Most likely, many will duplicate files that are already in your repo.
     If so, give preference to the new files and remove the old ones from your Git repo.
     Integrate necessary changes from the old files into the new ones.
   * Remove the old boilerplate files from Git
8. Make sure the edited project validates: `daps -d DC-example validate` 
9. Add and commit all changes to the Git repo (including the `doc-kit.conf` settings file): `git add . && git commit`

## Updating a Doc-Kit Project

1. Go to the project directory.
2. Run `doc-kit`.
3. Check whether everything still builds.
4. Commit.
