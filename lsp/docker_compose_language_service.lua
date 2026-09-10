return {
	cmd = { "docker-compose-langserver", "--stdio" },
	filetypes = { "yaml.dockercompose" },
	root_markers = { "compose.yaml", "compose.yml", "docker-compose.yaml", "docker-compose.yml", ".git" },
}
