
#include "Timer.h"

int count=0;

void Timer_Int_Handler(void *CallbackRef);

Timer::Timer(u32 count_value, XIntc *XIntcInstancePtr, TimerHandlerFunction handler)
: InterruptController_class(XIntcInstancePtr), handler(handler) {
	Xil_Out32(timer_count_value_data, count_value);
	Xil_Out32(timer_count_value_load, 0x01);
	Xil_Out32(timer_count_value_load, 0x00);

	u32 status;

	status=XIntc_Initialize(InterruptController_class, INTC_DEVICE_ID);
	status=XIntc_Connect(InterruptController_class, TIMER_INT_ID, handler, nullptr);
	status=XIntc_Start(InterruptController_class, XIN_REAL_MODE);
	XIntc_Enable(InterruptController_class, TIMER_INT_ID);
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XIntc_InterruptHandler, InterruptController_class);
	Xil_ExceptionEnable();
}

void Timer::timer_start(){

	Xil_Out32(timer_count_enable_reg, 0x01);
	Xil_Out32(timer_count_enable_reg, 0x00);
}

void Timer::timer_reset_en(){
	Xil_Out32(timer_reset, 0x01);
	Xil_Out32(timer_reset, 0x00);
}

void Timer::timer_change_count_value(u32 count_value)
{
	Xil_Out32(timer_count_value_data, count_value);
	Xil_Out32(timer_count_value_load, 0x01);
	Xil_Out32(timer_count_value_load, 0x00);
}

void Timer::timer_int_enable(){
	XIntc_Enable(InterruptController_class, TIMER_INT_ID);
}
void Timer::timer_int_disable(){
	XIntc_Disable(InterruptController_class, TIMER_INT_ID);
}


void Timer_Int_Handler(void *CallbackRef)
{
count++;
xil_printf("\n%d",count);

}











































