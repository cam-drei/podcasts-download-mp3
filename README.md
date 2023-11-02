### Use:
  Run ruby file in Terminal with syntax: ruby podcasts.rb <url> <number_of_articles>
  ex: 
  ```
  ruby podcasts.rb https://podcasts.google.com/feed/aHR0cHM6Ly9hbmNob3IuZm0vcy8zYTc3ZjczOC9wb2RjYXN0L3Jzcw?sa=X&ved=0CKkBEI7OAigFahkKEwjAst6P2JCCAxUAAAAAHQAAAAAQq8gB&hl=vi 5
  ```

### Introduce: Download newest mp3 files from https://podcasts.google.com/
1. get_mp3_from_url:
- Get html file
- Get the article_titles and the article_links corresponding
2. download_mp3_file:
  By default, it will create directory folder with name "podcasts" to download mp3 files in current file.

