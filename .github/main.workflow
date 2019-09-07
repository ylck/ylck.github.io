workflow "Build and deploy on push" {
  on = "push"
  resolves = ["zola deploy"]
}

action "zola deploy" {
  uses = "shalzz/zola-deploy-action@master"
  secrets = ["BLOG_BUILD"]
  env = {
    PAGES_BRANCH = "master"
  }
}
