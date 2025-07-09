/*!
 *****************************************************************************
 @file:    AD5940Main.c
 @author:  $Author: nxu2 $
 @brief:   Used to control specific application and process data.
 @version: $Revision: 766 $
 @date:    $Date: 2017-08-21 14:09:35 +0100 (Mon, 21 Aug 2017) $
 -----------------------------------------------------------------------------

Copyright (c) 2017-2019 Analog Devices, Inc. All Rights Reserved.

This software is proprietary to Analog Devices, Inc. and its licensors.
By using this software you agree to the terms of the associated
Analog Devices Software License Agreement.

*****************************************************************************/
#include "SqrWaveVoltammetry.h"
#include "RampTest.h"
#include <stdbool.h>

/**
   User could configure following parameters
**/

#define APPBUFF_SIZE 2048
uint32_t AppBuff[APPBUFF_SIZE];
float LFOSCFreq;    /* Measured LFOSC frequency */

/**
 * @brief An example to deal with data read back from AD5940. Here we just print data to UART
 * @note UART has limited speed, it has impact when sample rate is fast. Try to print some of the data not all of them.
 * @param pData: the buffer stored data for this application. The data from FIFO has been pre-processed.
 * @param DataCount: The available data count in buffer pData.
 * @return return 0.
*/
static int32_t RampShowResult(float *pData, uint32_t DataCount)
{
  static uint32_t index;
  /* Print data*/
  for(int i=0;i<DataCount;i++)
  {
    printf("index:%d, %.10f\n", index++, pData[i]);
    //printf("%.3f\n",pData[i]);
    //index++;
    //i += 10;  /* Print though UART consumes too much time. */
  }
  return 0;
}

/**
 * @brief The general configuration to AD5940 like FIFO/Sequencer/Clock. 
 * @note This function will firstly reset AD5940 using reset pin.
 * @return return 0.
*/
static int32_t AD5940PlatformCfg(void)
{
  CLKCfg_Type clk_cfg;
  SEQCfg_Type seq_cfg;  
  FIFOCfg_Type fifo_cfg;
  AGPIOCfg_Type gpio_cfg;
  LFOSCMeasure_Type LfoscMeasure;

  /* Use hardware reset */
  AD5940_HWReset();
  AD5940_Initialize();    /* Call this right after AFE reset */
	
  /* Platform configuration */
  /* Step1. Configure clock */
  clk_cfg.HFOSCEn = bTRUE;
  clk_cfg.HFXTALEn = bFALSE;
  clk_cfg.LFOSCEn = bTRUE;
  clk_cfg.HfOSC32MHzMode = bFALSE;
  clk_cfg.SysClkSrc = SYSCLKSRC_HFOSC;
  clk_cfg.SysClkDiv = SYSCLKDIV_1;
  clk_cfg.ADCCLkSrc = ADCCLKSRC_HFOSC;
  clk_cfg.ADCClkDiv = ADCCLKDIV_1;
  AD5940_CLKCfg(&clk_cfg);
  /* Step2. Configure FIFO and Sequencer*/
  fifo_cfg.FIFOEn = bTRUE;           /* We will enable FIFO after all parameters configured */
  fifo_cfg.FIFOMode = FIFOMODE_FIFO;
  fifo_cfg.FIFOSize = FIFOSIZE_4KB;   /* 2kB for FIFO, The reset 4kB for sequencer */
  fifo_cfg.FIFOSrc = FIFOSRC_SINC3;   /* */
  fifo_cfg.FIFOThresh = 4;            /*  Don't care, set it by application paramter */
  AD5940_FIFOCfg(&fifo_cfg);
  seq_cfg.SeqMemSize = SEQMEMSIZE_2KB;  /* 4kB SRAM is used for sequencer, others for data FIFO */
  seq_cfg.SeqBreakEn = bFALSE;
  seq_cfg.SeqIgnoreEn = bTRUE;
  seq_cfg.SeqCntCRCClr = bTRUE;
  seq_cfg.SeqEnable = bFALSE;
  seq_cfg.SeqWrTimer = 0;
  AD5940_SEQCfg(&seq_cfg);
  /* Step3. Interrupt controller */
  AD5940_INTCCfg(AFEINTC_1, AFEINTSRC_ALLINT, bTRUE);   /* Enable all interrupt in INTC1, so we can check INTC flags */
  AD5940_INTCClrFlag(AFEINTSRC_ALLINT);
  AD5940_INTCCfg(AFEINTC_0, AFEINTSRC_DATAFIFOTHRESH|AFEINTSRC_ENDSEQ|AFEINTSRC_CUSTOMINT0, bTRUE); 
  AD5940_INTCClrFlag(AFEINTSRC_ALLINT);
  /* Step4: Configure GPIOs */
  gpio_cfg.FuncSet = GP0_INT|GP1_SLEEP|GP2_SYNC;  /* GPIO1 indicates AFE is in sleep state. GPIO2 indicates ADC is sampling. */
  gpio_cfg.InputEnSet = 0;
  gpio_cfg.OutputEnSet = AGPIO_Pin0|AGPIO_Pin1|AGPIO_Pin2;
  gpio_cfg.OutVal = 0;
  gpio_cfg.PullEnSet = 0;
  AD5940_AGPIOCfg(&gpio_cfg);
  /* Measure LFOSC frequency */
  /**@note Calibrate LFOSC using system clock. The system clock accuracy decides measurement accuracy. Use XTAL to get better result. */
  LfoscMeasure.CalDuration = 1000.0;  /* 1000ms used for calibration. */
  LfoscMeasure.CalSeqAddr = 0;        /* Put sequence commands from start address of SRAM */
  LfoscMeasure.SystemClkFreq = 16000000.0f; /* 16MHz in this firmware. */
  AD5940_LFOSCMeasure(&LfoscMeasure, &LFOSCFreq);
  printf("LFOSC Freq:%f\n", LFOSCFreq);
 // AD5940_SleepKeyCtrlS(SLPKEY_UNLOCK);         /*  */
  return 0;
}
void AD5940_Init(void) {
  AD5940PlatformCfg();
}
/**
 * @brief The interface for user to change application paramters.
 * @return return 0.
*/
void AD5940_SWV_RampStructInit(void)
{
  AppSWVCfg_Type *pRampCfg;
  
  AppSWVGetCfg(&pRampCfg);
  /* Step1: configure general parmaters */
  pRampCfg->SeqStartAddr = 0x10;                /* leave 16 commands for LFOSC calibration.  */
  pRampCfg->MaxSeqLen = 512-0x10;              /* 4kB/4 = 1024  */
  pRampCfg->RcalVal = 10000.0;                  /* 10kOhm RCAL */
  pRampCfg->ADCRefVolt = 1.820f;               /* The real ADC reference voltage. Measure it from capacitor C12 with DMM. */
  pRampCfg->FifoThresh = 1023;                   /* Maximum value is 2kB/4-1 = 512-1. Set it to higher value to save power. */
  pRampCfg->SysClkFreq = 16000000.0f;           /* System clock is 16MHz by default */
  pRampCfg->LFOSCClkFreq = LFOSCFreq;           /* LFOSC frequency */
  pRampCfg->AdcPgaGain = ADCPGA_1P5;
  pRampCfg->ADCSinc3Osr = ADCSINC3OSR_4;
  
  /* Step 2:Configure square wave signal parameters */
  pRampCfg->RampStartVolt = -1000.0f;     /* Measurement starts at 0V*/
  pRampCfg->RampPeakVolt = 1000.0f;         /* Measurement finishes at -0.4V */
  pRampCfg->VzeroStart = 1300.0f;           /* Vzero is voltage on SE0 pin: 1.3V */
  pRampCfg->VzeroPeak = 1300.0f;          /* Vzero is voltage on SE0 pin: 1.3V */
  pRampCfg->Frequency = 5;                 /* Frequency of square wave in Hz */
  pRampCfg->SqrWvAmplitude = 50;       /* Amplitude of square wave in mV */
  pRampCfg->SqrWvRampIncrement = 50; /* Increment in mV*/
  pRampCfg->SampleDelay = 0.2f;             /* Time between update DAC and ADC sample. Unit is ms and must be < (1/Frequency)/2 - 0.2*/
  pRampCfg->LPTIARtiaSel = LPTIARTIA_200R;      /* Maximum current decides RTIA value */
  pRampCfg->bRampOneDir = bTRUE;//bTRUE;      /* Only measure ramp in one direction */
}



/**
 * @brief The interface for user to change application paramters.
 * @return return 0.
*/
void AD5940_CV_RampStructInit(void)
{
  AppRAMPCfg_Type *pRampCfg;

  AppRAMPGetCfg(&pRampCfg);
  /* Step1: configure general parmaters */
  pRampCfg->SeqStartAddr = 0x10;                /* leave 16 commands for LFOSC calibration.  */
  pRampCfg->MaxSeqLen = 1024-0x10;              /* 4kB/4 = 1024  */
  pRampCfg->RcalVal = 10000.0;                  /* 10kOhm RCAL */
  pRampCfg->ADCRefVolt = 1820.0f;               /* The real ADC reference voltage. Measure it from capacitor C12 with DMM. */
  pRampCfg->FifoThresh = 480;                   /* Maximum value is 2kB/4-1 = 512-1. Set it to higher value to save power. */
  pRampCfg->SysClkFreq = 16000000.0f;           /* System clock is 16MHz by default */
  pRampCfg->LFOSCClkFreq = LFOSCFreq;   /* LFOSC frequency */
  /* Configure ramp signal parameters */
  pRampCfg->RampStartVolt =  -400.0f;           /* -1V */
  pRampCfg->RampPeakVolt = +500.0f;           /* +1V */
  pRampCfg->VzeroStart = 1300.0f;               /* 1.3V */
  pRampCfg->VzeroPeak = 1300.0f;                /* 1.3V */
  pRampCfg->StepNumber = 200;                   /* Total steps. Equals to ADC sample number */
  pRampCfg->RampDuration = 4*1000;            /* X * 1000, where x is total duration of ramp signal. Unit is ms. */
  pRampCfg->SampleDelay = 1.8f;                 /* 7ms. Time between update DAC and ADC sample. Unit is ms. */
  pRampCfg->LPTIARtiaSel = LPTIARTIA_200R;       /* Maximum current decides RTIA value */
  pRampCfg->LPTIARloadSel = LPTIARLOAD_SHORT;
  pRampCfg->AdcPgaGain = ADCPGA_1P5;

}

void AD5940_SWV_Main(void)
{
  uint32_t temp;  
  AD5940_SWV_RampStructInit();

  //AD5940_McuSetLow();
  AppSWVInit(AppBuff, APPBUFF_SIZE);    /* Initialize RAMP application. Provide a buffer, which is used to store sequencer commands */


  AD5940_Delay10us(100000);   /* Add a delay to allow sensor reach equilibrium befor starting the measurement */
  AppSWVCtrl(APPCTRL_START, 0);          /* Control IMP measurement to start. Second parameter has no meaning with this command. */

  while(1)
  {
    if(AD5940_GetMCUIntFlag())
    {
      AD5940_ClrMCUIntFlag();
      temp = APPBUFF_SIZE;
      AppSWVISR(AppBuff, &temp);
      RampShowResult((float*)AppBuff, temp);
    }

  }
}


void AD5940_CV_Main(void)
{
  uint32_t temp;
  AppRAMPCfg_Type *pRampCfg;
  AD5940_CV_RampStructInit();

  AppRAMPInit(AppBuff, APPBUFF_SIZE);    /* Initialize RAMP application. Provide a buffer, which is used to store sequencer commands */
  AppRAMPCtrl(APPCTRL_START, 0);          /* Control IMP measurement to start. Second parameter has no meaning with this command. */

  while(1)
  {
    AppRAMPGetCfg(&pRampCfg);
    if(AD5940_GetMCUIntFlag())
    {
      AD5940_ClrMCUIntFlag();
      temp = APPBUFF_SIZE;
      AppRAMPISR(AppBuff, &temp);
      RampShowResult((float*)AppBuff, temp);
    }
    /* Repeat Measurement continuously*/
    if(pRampCfg->bTestFinished ==bTRUE)
    {
      AD5940_Delay10us(200000);
      pRampCfg->bTestFinished = bFALSE;
      AD5940_SEQCtrlS(bTRUE);   /* Enable sequencer, and wait for trigger */
      AppRAMPCtrl(APPCTRL_START, 0);
    }
  }
}

void AD5940_GPIO_test(void) {

  AGPIOCfg_Type pAgpioCfg;
  pAgpioCfg.FuncSet = GP1_GPIO | GP3_GPIO | GP5_GPIO;
  pAgpioCfg.OutputEnSet = AGPIO_Pin1 | AGPIO_Pin3 | AGPIO_Pin5;
  pAgpioCfg.InputEnSet = 0;
  pAgpioCfg.PullEnSet = 0;
  pAgpioCfg.OutVal = 0;
  AD5940_AGPIOCfg(&pAgpioCfg);

  //for (int i = 0; i < 3; i++)
  while(1)
  {
    AD5940_Delay10us(100000);
    AD5940_AGPIOSet(AGPIO_Pin1|AGPIO_Pin3 | AGPIO_Pin5);
    AD5940_Delay10us(100000);
    AD5940_AGPIOClr(AGPIO_Pin1|AGPIO_Pin3 | AGPIO_Pin5);
  }
 }

