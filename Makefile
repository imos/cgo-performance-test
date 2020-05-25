run: docker
	docker run --rm -it --volume=$(shell pwd):/repo -w /repo \
		--volume=/tmp/cgo-peformance-test/.cache:/root/.cache \
		cgo-peformance-test bash -c " \
			bazel run -c opt //:main && \
			cat /proc/cpuinfo"
.PHONY: run

docker:
	docker build -t cgo-peformance-test .
.PHONY: docker

################################################################################
# For debugging.
################################################################################

start: docker
	docker run --rm -d --volume=$(shell pwd):/repo -w /repo \
		--volume=/tmp/cgo-peformance-test/.cache:/root/.cache \
		--name=cgo-peformance-test \
		cgo-peformance-test sleep infinity
.PHONY: start

stop:
	docker kill cgo-peformance-test
.PHOY: stop

exec:
	docker exec -it cgo-peformance-test bash
.PHONY: exec
