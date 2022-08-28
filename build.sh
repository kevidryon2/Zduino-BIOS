for infile in src/*.asm; do
	filename=$(echo $infile | sed 's/src\///' | sed 's/\.asm//');
	asm_name="src/$filename.asm";
	bin_name="build/bin/$filename.bin";
	echo Selected $asm_name --\> $bin_name;
	touch build/$filename.lst
	touch build/$filename.lbl
	./tools/z80asm -i $asm_name -o $bin_name -v -v -l -L -I src;
done
./tools/zlink build build.zls;
