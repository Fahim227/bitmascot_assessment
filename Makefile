FVM_CMD := fvm flutter

ff:
	$(FVM_CMD)

clean:
	rm -f pubspec.lock \
	&& $(FVM_CMD) clean

pub-get:
	$(FVM_CMD) pub get

runner-clean:
	$(FVM_CMD) pub run build_runner clean

runner-build:
	make runner-clean && $(FVM_CMD) pub run build_runner build -d

clean-get:
	make clean && make pub-get

dart-fix-format:
	fvm dart fix --apply . &&\
	fvm dart format .

clean-runner-build:
	make clean-get && make runner-build