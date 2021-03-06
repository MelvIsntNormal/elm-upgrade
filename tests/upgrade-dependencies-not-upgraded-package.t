When a dependency has not yet been upgraded:

  $ export PATH="$TESTDIR/bin_elm19:$TESTDIR/bin_elmformat:$TESTDIR/bin"
  $ rsync -a "$TESTDIR/example_elm18_package/" ./
  $ jq '.dependencies += { "avh4/fake-package": "1.0.1 <= v < 2.0.0" }' elm-package.json > tmp && mv tmp elm-package.json
  $ git init -q && git add . && git commit -q -m "."
  $ elm-upgrade
  INFO: Found elm at /.*/tests/bin_elm19/elm (re)
  INFO: Found elm 0.19.0
  INFO: Found elm-format at /.*/tests/bin_elmformat/elm-format (re)
  INFO: Found elm-format 0.8.0
  INFO: Cleaning ./elm-stuff before upgrading
  INFO: Converting elm-package.json -> elm.json
  INFO: Detected a package project (this project has exposed modules)
  INFO: Switching from elm-lang/core (deprecated) to elm/core
  INFO: Installing latest version of elm/core
  It is already installed!
  WARNING: avh4/fake-package has not been upgraded to 0.19 yet!
  INFO: Upgrading *.elm files in src/
  
  
  SUCCESS! Your project's dependencies and code have been upgraded.
  However, your project may not yet compile due to API changes in your
  dependencies.
  
  See <https://github.com/elm/compiler/blob/master/upgrade-docs/0.19.md>
  and the documentation for your dependencies for more information.
  
  WARNING! 1 of your dependencies have not yet been upgraded to
  support Elm 0.19.
    - https://github.com/avh4/fake-package
  
  $ git add -N .
  $ git diff elm.json
  diff --git a/elm.json b/elm.json
  index e69de29..[0-9a-f]* 100644 (re)
  --- a/elm.json
  +++ b/elm.json
  @@ -0,0 +1,16 @@
  +{
  +    "type": "package",
  +    "name": "avh4/project",
  +    "summary": "helpful summary of your project, less than 80 characters",
  +    "license": "MIT",
  +    "version": "1.0.0",
  +    "exposed-modules": [
  +        "CoolData"
  +    ],
  +    "elm-version": "0.19.0 <= v < 0.20.0",
  +    "dependencies": {
  +        "elm/core": "1.0.0 <= v < 2.0.0",
  +        "avh4/fake-package": "1.0.1 <= v < 2.0.0"
  +    },
  +    "test-dependencies": {}
  +}
  \ No newline at end of file
