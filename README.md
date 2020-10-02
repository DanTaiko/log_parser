# log_parser

Heavy metal log parser is my try to write a ruby script.

## Version 0.1.1-a.2

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

Run HELP for the command delails

   ```sh
    $ bin/parser help
   ```
 
#### Commands:

**parser help [COMMAND]**                       # Describe available commands or one specific command

**parser unique_webpages_rating [PATH/TO/FILE]**  # list of unique webpages with most page views

**parser webpages_rating [PATH/TO/FILE]**         # list of webpages with most page views
 

## How to run specs

   ```sh
    $ rspec
   ```

## Possible Improvements (ideas)

1. Improve the user interface and CLI

2. Make a gem out of this app

3. Do more testing