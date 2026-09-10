return {
	cmd = { "docker-language-server", "start", "--stdio" },
	filetypes = { "dockerfile", "dockerbake" },
	root_markers = { "Dockerfile", "Containerfile", ".git" },
}
