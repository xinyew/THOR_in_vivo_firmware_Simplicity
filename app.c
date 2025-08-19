/***************************************************************************//**
 * @file
 * @brief Top level application functions
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/
#include "app_assert.h"
#include "gpiointerrupt.h"
#include "sl_emlib_gpio_init_AD5940_INT_config.h"
#include "app.h"
#include <stdio.h>
#include "sl_emlib_gpio_init_LED_config.h"



/***************************************************************************//**
 * Initialize application.
 ******************************************************************************/
volatile uint32_t ucInterrupted = 0;
void ad5940int_handler (uint8_t intNo) {
  app_assert(intNo == 5, "Invalid interrupt number: %d", intNo);  // Check for interrupt 5
  ucInterrupted = 1;
  GPIO_IntClear(1 << 5);  // Clear interrupt 5
}

void ad5940int_init() {
  GPIOINT_Init();
  GPIOINT_CallbackRegister(5, ad5940int_handler);  // Use interrupt 5 for PC5
  GPIO_ExtIntConfig(SL_EMLIB_GPIO_INIT_AD5940_INT_PORT, SL_EMLIB_GPIO_INIT_AD5940_INT_PIN, 5, false, true, true);  // Use interrupt 5
  GPIO_IntEnable(1 << 5);  // Enable interrupt 5
  printf("Hello AD5940-Build Time:%s\n",__TIME__);
}

void app_init(void)
{
  ad5940int_init();

}

/***************************************************************************//**
 * App ticking function.
 ******************************************************************************/
void app_process_action(void)
{

  sl_udelay_wait(2000000);
  GPIO_PinOutToggle(SL_EMLIB_GPIO_INIT_LED_PORT,
                     SL_EMLIB_GPIO_INIT_LED_PIN);
  AD5940_Init();
  AD5940_Set_Mux(0, true);
  AD5940_SWV_Main();
}
