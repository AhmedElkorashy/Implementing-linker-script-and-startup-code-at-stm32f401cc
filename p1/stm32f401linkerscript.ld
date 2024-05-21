/*entry point of application to be run*/
ENTRY(Reset_Handler)
MEMORY
{
	FLASH(rx) : ORIGIN = 0X08000000 ,LENGTH = 256K 
	SRAM(rwx) : ORIGIN = 0X20000000 ,LENGTH =20K	
}
SECTIONS 
{
	.text : 
	{
	s_text = . ;
	*(.isr_vector)
	*(.text)
	*(.rodata)		
	e_text = . ;	
	}>FLASH AT >FLASH		/*VMA->LMA   */
	.data :
	{
	s_data = . ;
		*(.data)
		. = ALIGN (8);
	e_data = . ;

	}>SRAM AT >FLASH
	.bss :
	{
	s_bss = . ;

	*(.bss)
	e_bss = . ;
	}>SRAM
	
}