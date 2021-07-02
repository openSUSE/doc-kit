0.5 - 2021-07-02 - sknorr
  - Allow overriding default source branch and source repo by using
    variables `DOCKIT_BRANCH` and `DOCKIT_REPO` on the command line
  - Improve manifest validation
  - Remove `--no-check-certificates` from `wget` calls

0.4 - 2021-03-12 - sknorr
  - Use `main` branch of doc-kit repo by default

0.3 - 2018-10-02 - sknorr
  - Make variants code actually work

0.2 - 2018-09-17 - sknorr
  - Make variants code work
  - Include doc-kit minimum compatibility version in KITS/MANIFEST
    file headers:
      v0.2
      --
  - Add/check SHA-1 sums to/in doc-kit.conf (fixes a TODO, see #1)

0.1 - 2018-03-20 - sknorr
  - Initial version
