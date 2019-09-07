workflow "Build and deploy on push" {
  on = "push"
  resolves = ["zola deploy"]
}

action "zola deploy" {
  uses = "shalzz/zola-deploy-action@master"
  secrets = ["362f325cda5ddeed54195b9efd46e86b3251b5d8"]
  env = {
    PAGES_BRANCH = "master"
  }
}
