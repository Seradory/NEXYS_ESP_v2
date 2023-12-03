

#include "xil_io.h"
#include "xil_types.h"
#include "sleep.h"
#include "xil_printf.h"
#include "xintc.h"


#include "xparameters.h"
#include "xil_exception.h"
#include "xuartlite.h"
#include "uart_com.h"
#include <stdlib.h>
#include "Timer.h"

static XIntc InterruptController;
static XUartLite UPTR_PC;
static XUartLite UPTR_ESP;
int PC_RECV=0;
int ESP_RECV=0;



u8 esp_recv_data[3200]={};
int esp_recv_index=0;
u8 pc_recv_data[3200]={};
int pc_recv_index=0;


Timer* t1;

void RecvHandlerESP(void* CallbackRef, unsigned int EventData);
void RecvHandlerPC(void* CallbackRef, unsigned int EventData);
void TimerInterruptHandler(void *CallbackRef);
int main(){


	uart_com u1(XPAR_AXI_UARTLITE_1_DEVICE_ID, XPAR_INTC_0_UARTLITE_1_VEC_ID,&UPTR_PC, &InterruptController, XPAR_MICROBLAZE_0_AXI_INTC_DEVICE_ID, RecvHandlerPC);
	u1.uart_com_int_enable();

	uart_com u2(XPAR_AXI_UARTLITE_0_DEVICE_ID, XPAR_INTC_0_UARTLITE_0_VEC_ID,&UPTR_ESP, &InterruptController, XPAR_MICROBLAZE_0_AXI_INTC_DEVICE_ID, RecvHandlerESP);
	u2.uart_com_int_enable();


	Timer temp(0x05F5E100, &InterruptController,TimerInterruptHandler);
	temp.timer_int_enable();
	t1=&temp;
	while(true){

		if(pc_recv_index>50){
			u2.uart_com_send(pc_recv_data, pc_recv_index);
			pc_recv_index=0;

		}

		if(esp_recv_index>50){
			u1.uart_com_send(esp_recv_data, esp_recv_index);
			esp_recv_index=0;

		}


	}

	return 0;
}


void RecvHandlerESP(void* CallbackRef, unsigned int EventData) {
	t1->timer_reset_en();
	u8 temp_data='\0';
	XUartLite_Recv(&UPTR_ESP,&temp_data, 1);
	*(esp_recv_data+esp_recv_index)=temp_data;
	esp_recv_index++;
	t1->timer_start();
}
void RecvHandlerPC(void* CallbackRef, unsigned int EventData) {
	t1->timer_reset_en();
	u8 temp_data='\0';
	XUartLite_Recv(&UPTR_PC,&temp_data, 1);
	*(pc_recv_data+pc_recv_index)=temp_data;
	pc_recv_index++;
	t1->timer_start();

}

void TimerInterruptHandler(void *CallbackRef) {
	int sayi=5;

}

