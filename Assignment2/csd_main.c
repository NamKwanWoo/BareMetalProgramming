/*
* csd_main.c
*
*  Created on: 2018. 3. 24.
*      Author: nam
*/

int csd_main(int n)
{
	unsigned int* swithches;				// declare swithces variable
	swithches = (unsigned*)0x41210000;		// assign real swithces address to variable

	// case SW7 position	100 msec
	if (*swithches >= 0x80)
	{
		for (unsigned int i = 0; i < 0x500000; i++)
			;
	}

	// case SW6 position	200 msec
	else if (*swithches >= 0x40)
	{
		for (unsigned int i = 0; i < 0x1000000; i++)
			;
	}

	// case SW5 position	300 msec
	else if (*swithches >= 0x20)
	{
		for (unsigned int i = 0; i < 0x1500000; i++)
			;
	}

	// case SW4 position	400 msec
	else if (*swithches >= 0x10)
	{
		for (unsigned int i = 0; i < 0x2000000; i++)
			;
	}
	// case SW3 position	500 msec
	else if (*swithches >= 0x08)
	{
		for (unsigned int i = 0; i < 0x2500000; i++)
			;
	}

	// case SW2 position	600 msec
	else if (*swithches >= 0x04)
	{
		for (unsigned int i = 0; i < 0x3000000; i++)
			;
	}

	// case SW1 position	700 msec
	else if (*swithches >= 0x02)
	{
		for (unsigned int i = 0; i < 0x3500000; i++)
			;
	}

	// case SW0 position	800 msec
	else if (*swithches >= 0x01)
	{
		for (unsigned int i = 0; i < 0x4000000; i++)
			;
	}

	// Otherwise	1000 msec
	else
	{
		//for (unsigned int i = 0; i < 0x6670000; i++)
		//for (unsigned int i = 0; i < 0x6000000; i++)
		for (unsigned int i = 0; i < 0x5000000; i++)
			;
	}

	return 0;
}
