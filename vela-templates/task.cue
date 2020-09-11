#Template: {
	apiVersion: "v1"
	kind:       "Job"
	metadata: name: task.name
	spec: {
		parallelism: task.count
		completions: task.count
		template:
			spec:
				containers: [{
					image: task.image
					name:  task.name
					ports: [{
						containerPort: task.port
						protocol:      "TCP"
						name:          "default"
					}]
				}]
	}
}
task: {
	// +usage=specify number of tasks to run in parallel
	// +short=c
	count: *1 | int
	name:  string
	// +usage=specify app image
	// +short=i
	image: string
	// +usage=specify port for container
	// +short=p
	port: *6379 | int
}
