for infile in src/*.asm; do
	filename=$(echo $infile | sed 's/src\///' | sed 's/\.asm//');
	asm_name="src/$filename.asm";bin_name="build/$filename.bin";
	echo Selected $asm_name --\> $bin_name;
	touch build/$filename.lst
	touch build/$filename.lbl
	./tools/z80asm -i $asm_name -o $bin_name -v -v -l -I src > build/list.log > build/err.log;
	cat build/list.log
	./tools/z80asm -i $asm_name -o /dev/null -v -v -L -I src > build/label.log > build/err.olog;
	cat build/list.log
done
./tools/zlink build build.zls;
