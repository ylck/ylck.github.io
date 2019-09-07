workflow "Build and deploy on push" {
  on = "push"
  resolves = ["zola deploy"]
}

action "zola deploy" {
  uses = "shalzz/zola-deploy-action@master"
  secrets = ["f22e17b80a256ed2dd36a28746529ad920897852"]
  env = {
    PAGES_BRANCH = "master"
  }
}
