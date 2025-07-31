return {
  "nathom/filetype.nvim",
  opts = {
    overrides = {
      extensions = {
        sh = "bash",
        tf = "terraform",
        tfvars = "terraform",
        tfbackend = "terraform",
        tfstate = "json",
      },
      literal = {
        [".envrc"] = "bash",
      },
      complex = {
        [".*/templates/.*%.yaml"] = "helm",
        [".*/templates/.*%.tpl"] = "helm",
        ["helmfile.yaml"] = "helm",
        [".vscode/.*%.json"] = "jsonc",
      },
      shebang = {
        dash = "sh",
      },
    },
    config = true,
  },
}
