workflow "Build and deploy on push" {
  on = "push"
  resolves = ["zola deploy"]
}

action "zola deploy" {
  uses = "shalzz/zola-deploy-action@master"
  secrets = ["af3477349fc1957e2e3a6851809845da4681cc4d"]
  env = {
    PAGES_BRANCH = "master"
  }
}