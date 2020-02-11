test:
	go test -race ./...
test-performance:
	N=1000000 go test -race -v ./... -run=TestPerformance
install: check test
	go install ./...
vet:
	go tool vet --all .
lint:
	golint ./...
errcheck:
	errcheck ./...
gocyclo:
	-gocyclo -over 10 .
check: test gocyclo vet lint errcheck
	echo "OK"
install-tools:
	go get -u github.com/fzipp/gocyclo
	go get -u github.com/golang/lint
	go get -u github.com/kisielk/errcheck
