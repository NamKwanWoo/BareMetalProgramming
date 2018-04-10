/*
 * csd_menu2.c
 *
 *  Created on: 2018. 4. 9.
 *      Author: nam
 */


int csd_menu4(int n)
{
	unsigned int* leds;
	leds = (unsigned*)0x41200000;

	*leds = 0x01;
	for (unsigned int i = 0; i < 0x2000000; i++)
		;
	*leds = 0x02;
	for (unsigned int i = 0; i < 0x2000000; i++)
		;
	*leds = 0x04;
	for (unsigned int i = 0; i < 0x2000000; i++)
		;
	*leds = 0x08;
	for (unsigned int i = 0; i < 0x2000000; i++)
		;

	*leds = 0x010;
	for (unsigned int i = 0; i < 0x2000000; i++)
		;
	*leds = 0x020;
	for (unsigned int i = 0; i < 0x2000000; i++)
		;
	*leds = 0x040;
	for (unsigned int i = 0; i < 0x2000000; i++)
		;
	*leds = 0x080;
		for (unsigned int i = 0; i < 0x2000000; i++)
			;
	return 0;
}
