#include "sl_emlib_gpio_simple_init.h"
#include "sl_emlib_gpio_init_AD5940_CS_config.h"
#include "sl_emlib_gpio_init_AD5940_INT_config.h"
#include "sl_emlib_gpio_init_AD5940_RST_config.h"
#include "sl_emlib_gpio_init_LED_config.h"
#include "sl_emlib_gpio_init_MUX_EN_config.h"
#include "em_gpio.h"
#include "em_cmu.h"

void sl_emlib_gpio_simple_init(void)
{
  CMU_ClockEnable(cmuClock_GPIO, true);
  GPIO_PinModeSet(SL_EMLIB_GPIO_INIT_AD5940_CS_PORT,
                  SL_EMLIB_GPIO_INIT_AD5940_CS_PIN,
                  SL_EMLIB_GPIO_INIT_AD5940_CS_MODE,
                  SL_EMLIB_GPIO_INIT_AD5940_CS_DOUT);

  GPIO_PinModeSet(SL_EMLIB_GPIO_INIT_AD5940_INT_PORT,
                  SL_EMLIB_GPIO_INIT_AD5940_INT_PIN,
                  SL_EMLIB_GPIO_INIT_AD5940_INT_MODE,
                  SL_EMLIB_GPIO_INIT_AD5940_INT_DOUT);

  GPIO_PinModeSet(SL_EMLIB_GPIO_INIT_AD5940_RST_PORT,
                  SL_EMLIB_GPIO_INIT_AD5940_RST_PIN,
                  SL_EMLIB_GPIO_INIT_AD5940_RST_MODE,
                  SL_EMLIB_GPIO_INIT_AD5940_RST_DOUT);

  GPIO_PinModeSet(SL_EMLIB_GPIO_INIT_LED_PORT,
                  SL_EMLIB_GPIO_INIT_LED_PIN,
                  SL_EMLIB_GPIO_INIT_LED_MODE,
                  SL_EMLIB_GPIO_INIT_LED_DOUT);

  GPIO_PinModeSet(SL_EMLIB_GPIO_INIT_MUX_EN_PORT,
                  SL_EMLIB_GPIO_INIT_MUX_EN_PIN,
                  SL_EMLIB_GPIO_INIT_MUX_EN_MODE,
                  SL_EMLIB_GPIO_INIT_MUX_EN_DOUT);
}
