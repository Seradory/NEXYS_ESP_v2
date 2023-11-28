

#include "xil_io.h"
#include "xil_types.h"
#include "sleep.h"
#include "xil_printf.h"
#include "xintc.h"
//#include "Timer.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xuartlite.h"
#include "uart_com.h"

static XIntc InterruptController;
static XUartLite UPTR_PC;



int main(){
	u8 serdar[150]={};
	//Timer t1(0x05F5E100, &InterruptController);
	//t1.timer_int_enable();
	uart_com u1(XPAR_AXI_UARTLITE_1_DEVICE_ID, XPAR_INTC_0_UARTLITE_0_VEC_ID,&UPTR_PC, &InterruptController, XPAR_MICROBLAZE_0_AXI_INTC_DEVICE_ID, serdar, 1);
	u1.uart_com_int_enable();
	u1.uart_com_send((u8*)"serdar", 6);
	while(true){
		//t1.timer_start();



	}











	return 0;
}