#ifndef TIMER_H
#define TIMER_H

#include "xparameters.h"
#include "xil_types.h"
#include "xintc.h"
#include "xil_exception.h"

#define TIMER_BASE_ADDRESS 0x44A00000
#define TIMER_INT_ID	1
#define BAUDRATE 9600
#define CLOCK_FREQUENCY 100_000_000

#define INTC_DEVICE_ID	XPAR_INTC_0_DEVICE_ID
#define TIMER_INT_ID	XPAR_MICROBLAZE_0_AXI_INTC_MYTIMER_0_INTERRUPT_INTR

typedef void (*TimerHandlerFunction)(void*); // Handler fonksiyonu i�in tip tan�m�

class Timer{
private:
	XIntc* InterruptController_class;
	TimerHandlerFunction handler; // Handler fonksiyonu i�in �ye de�i�keni
	u32 timer_count_enable_reg=TIMER_BASE_ADDRESS+0;
	u32 timer_count_value_data=TIMER_BASE_ADDRESS+4;
	u32 timer_count_value_load=TIMER_BASE_ADDRESS+8;
	u32 timer_reset=TIMER_BASE_ADDRESS+12;

public:
	Timer(u32 count_value, XIntc* XIntcInstancePtr, TimerHandlerFunction handler);

	void timer_start();

	void timer_change_count_value(u32 count_value);

	void timer_reset_en();

	void timer_int_enable();

	void timer_int_disable();
};
#endif
