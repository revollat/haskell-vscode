
stack new myapp new-template --bare --resolver lts-16.10
stack build
stack exec -- myapp-exe -o circle.svg -w 400