provider "aws" {
  region = "eu-west-1"
}

module "user_pool" {
  source = "../../"

  name = "test-resource-servers"
  resource_servers = {
    Books = {
      identifier = "https://example.com/books"
      scopes = [
        {
          scope_name        = "books.read"
          scope_description = "Allow read operations on books"
        },
        {
          scope_name        = "books.write"
          scope_description = "Allow write operations on books"
        }
      ]
    }
    Posts = {
      identifier = "https://example.com/posts"
      scopes = [
        {
          scope_name        = "posts.read"
          scope_description = "Allow read operations on posts"
        },
        {
          scope_name        = "posts.write"
          scope_description = "Allow write operations on posts"
        }
      ]
    }
  }
}
