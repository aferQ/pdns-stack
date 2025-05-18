group "pdns-stack" {
  targets = ["pdns-auth-master", "powerdns-admin"]
}
target "pdns-auth-master" {
  context = "./pdns"
  dockerfile = "./Dockerfile"
}
target "powerdns-admin" {
  context = "."
  dockerfile = "Dockerfile.admin"
}
