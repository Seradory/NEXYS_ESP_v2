#ifndef UART_COM_H
#define UART_COM_H

#include "xparameters.h"
#include "xil_types.h"
#include "xintc.h"
#include "xil_exception.h"
#include "xuartlite.h"




void SendHandler(void* CallbackRef, unsigned int EventData);


class uart_com{
private:
u32 ULITE_INT_IRQ_ID;
XUartLite* UPTR;
XIntc* InterruptController;




public:
	int avalible_flag=0;

	uart_com(u32 ULITE_DEVICE_ID,u32 ULITE_INT_IRQ_ID,XUartLite* UPTR,XIntc* InterruptController,u32 XINTC_DEV_ID,XUartLite_Handler FuncPtr);
	void uart_com_send(u8* Send_Array,int length);
	void uart_com_int_enable();
	void uart_com_int_disable();



























};
#endif
