return {
	"nathom/filetype.nvim",
	opts = {
		overrides = {
			extensions = {
				sh = "bash",
				tf = "terraform",
				tfvars = "terraform",
				tfstate = "json",
			},
			complex = {
				[".*/templates/.*%.yaml"] = "helm",
				[".*/templates/.*%.tpl"] = "helm",
				["helmfile.yaml"] = "helm",
			},
			shebang = {
				dash = "sh",
			},
		},
		config = true
	}
}
