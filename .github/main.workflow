workflow "Build and deploy on push" {
  on = "push"
  resolves = ["zola deploy"]
}

action "zola deploy" {
  uses = "shalzz/zola-deploy-action@master"
  secrets = ["blog-build"]
  env = {
    PAGES_BRANCH = "master"
  }
}
