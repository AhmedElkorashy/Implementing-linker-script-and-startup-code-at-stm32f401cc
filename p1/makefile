## 
AC=arm-none-eabi-gcc 

LN = -T stm32f401linkerscript.ld -nostdlib 

## first rule to generate main.o 
## to use dependencey use $^
## to use rule name  $@
	 

main.o:main.c
	 $(AC) -c $^ -o $@

mrcc.o:MRCC_Program.c
	$(AC) -c $^ -o $@
	
mgpio.o:MGPIO_Program.c 
	$(AC) -c $^ -o $@
	
stm32f401_startupcode.o:stm401f_startupcode.c
	$(AC) -c $^ -o $@
	
file.elf:
	${AC} *.o ${LN} -o file.elf
file.map:
	${AC} *.o ${LN}   -Wl,-Map=file.map





	
	
.PHONY: clean
clean:
	rm -rf  *.o file.elf file.map
all:clean main.o mrcc.o  mgpio.o  stm32f401_startupcode.o file.elf file.map
