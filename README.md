# README

## Getting Started

Run the following in order to get the db container up and running:

```bash
docker-compose up
```

Then run the following commands for creating the db scheme:

```bash
rake db:create
rails db:migrate
```

Strat the server:

```bash
rails s
```

Navigate to http://localhost:3000/word_counters and all should be up and running

## Assumptions

- URLs and file paths should be entered with escaped characters: C://Desktop//file.txt
- Supporting HTTP URLs (might get certificate error for https sites)
- Words are counted with no case sensitivity (This and this are the same)
- For now, HTML tags are inserted as input as well since each website is build differently and
  did not want to filter some tags out. It's possible to parse html and get specific elements with Nokogiri gem
