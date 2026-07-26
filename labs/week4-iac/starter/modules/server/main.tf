resource "random_pet" "server_name" {
  length = var.length
}

resource "local_file" "hello" {
  filename = "${path.root}/hello.txt"
  content  = "Hello from server ${random_pet.server_name.id}\n"
}