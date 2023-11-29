

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
static XUartLite UPTR_ESP;


#define UARTLITE_INT_IRQ_ID     XPAR_INTC_0_UARTLITE_0_VEC_ID

void RecvHandler(void* CallbackRef, unsigned int EventData);
void RecvHandler2(void* CallbackRef, unsigned int EventData);
int main(){

	//Timer t1(0x05F5E100, &InterruptController);
	//t1.timer_int_enable();
	uart_com u1(XPAR_AXI_UARTLITE_1_DEVICE_ID, XPAR_INTC_0_UARTLITE_1_VEC_ID,&UPTR_PC, &InterruptController, XPAR_MICROBLAZE_0_AXI_INTC_DEVICE_ID, RecvHandler2);
	u1.uart_com_int_enable();

	uart_com u2(XPAR_AXI_UARTLITE_0_DEVICE_ID, XPAR_INTC_0_UARTLITE_0_VEC_ID,&UPTR_ESP, &InterruptController, XPAR_MICROBLAZE_0_AXI_INTC_DEVICE_ID, RecvHandler);
	u2.uart_com_int_enable();
	//u2.uart_com_send((u8*)"1", 1);
	while(true){
		//t1.timer_start();
		sleep(4);
		u2.uart_com_send((u8*)"test", 4);


	}











	return 0;
}


void RecvHandler(void* CallbackRef, unsigned int EventData) {
	u8 single_byte_buffer[1]={};
	XUartLite_Recv((XUartLite*)CallbackRef, single_byte_buffer, 1);
}
void RecvHandler2(void* CallbackRef, unsigned int EventData) {
	u8 single_byte_buffer[1]={};
	XUartLite_Recv((XUartLite*)CallbackRef, single_byte_buffer, 1);
}
