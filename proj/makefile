all: makedir build run

makedir:
	@mkdir -p bin/

build:
	javac -cp lib/Driver.jar -d bin/ App.java

run:
	java -cp "bin/:lib/Driver.jar" App

clean:
	rm -rf bin/


