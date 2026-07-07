return {
	-- Required to install and update treesitter parsers
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
}
