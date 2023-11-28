
#include <stdio.h>
#include <stdbool.h>
#include "system.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"

bool flag=0;
unsigned int data=0;

int main()
{
  printf("init function\n");
  // configuracion de timer

  while(1){
	  flag = IORD_ALTERA_AVALON_PIO_DATA(DATA_VALID_BASE);
	  if(flag){
          data = IORD_ALTERA_AVALON_PIO_DATA(DATA_COMPAS_BASE);
          printf("valeur de compas = 0x%02X\n",data);
          while(flag){
        	  flag = IORD_ALTERA_AVALON_PIO_DATA(DATA_VALID_BASE);
          }
	  }
  }
  return 0;
}

