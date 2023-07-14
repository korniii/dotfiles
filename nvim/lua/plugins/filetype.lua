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
		},
		config = true
	}
}
