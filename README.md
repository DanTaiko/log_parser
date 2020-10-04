# log_parser

Heavy metal log parser is my try to write a ruby script.

## Version 0.1.3-a.1

The alpha-version is for demonstrating my programmer skills.

## Task description

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
e.g.:
`./parser.rb webserver.log`

b. Returns the following:

* list of webpages with most page views ordered from most pages views to less page views
e.g.:
`/home 90 visits
/index 80 visits etc...`

* list of webpages with most unique page views also ordered
e.g.:
`/about/2 8 unique views
/index 5 unique views etc...`

## Installation

1. Clone the log_parser code

2. Then, in the log_parser directory:

   ```sh
    $ bundle install
   ```

## How to run app

Basic command:

   ```sh
    $ bin/parser analyze [PATH/TO/FILE]
   ```
   
Run HELP for the command delails

   ```sh
    $ bin/parser help
   ```
 
#### Commands:

**parser help [COMMAND]**                   # Describe available commands or one specific command

**parser analyze [PATH/TO/FILE]**           # list the webpages with visits and then list the webpages with unique views

**parser resources_rating [PATH/TO/FILE]**  # list the resources with most views

**parser webpages_rating [PATH/TO/FILE]**   # list the webpages with most page views
 

## How to run specs

Run RSPEC in the log_parser directory

   ```sh
    $ rspec
   ```

## Possible Improvements (ideas)

1. Improve the user interface and CLI, especially the error handling.

2. The Line class should be splitted into the LogLine and PrintLine classes.

3. Do more integration and concrete testing.

4. The specs could be made more readable.

5. Make the app documentation.

6. Make a gem out of this app.

7. Have fun!