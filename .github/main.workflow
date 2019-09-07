workflow "Build and deploy on push" {
  on = "push"
  resolves = ["zola deploy"]
}

action "zola deploy" {
  uses = "shalzz/zola-deploy-action@master"
<<<<<<< HEAD
  secrets = ["TOKEN"]
=======
  secrets = ["BLOG_BUILD"]
>>>>>>> 701b54997dafe7858f4d4fa2abbdff00867b8fe4
  env = {
    PAGES_BRANCH = "master"
  }
}
