#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#define TRUE (1)
#define FALSE (0)




void init(void);



typedef enum state_t {

    TAKEN_PASSED    = 0,
    LED_EN          = 1,
    SET_LED_DIRECT  = 2,
    TOUCHED         = 3,
    MEAS_DONE       = 4,
    LED0            = 5,
    LED1            = 6,
    LED2            = 7

} state_t;

typedef enum msg_t {

    MSG_SLOT_TAKEN  = 0,
    MSG_LED_EN      = 1,
    MSG_LED_DIRECT  = 2,
    MSG_IS_TOUCHED  = 3,
    MSG_RESERVED    = 4,
    MSG_LED0        = 5,
    MSG_LED1        = 6,
    MSG_LED2        = 7

} msg_t;


#define DEFAULT_CONFIGURATION ( 0x00 )
#define WRITE_PROTECT_DISABLE_SIG (0xD8)

#define TOUCH_TIMEOUT ((uint16_t)40000) //roughly 4ms @ 8MHz
#define TOUCH_PIN (PIN1) //TODO: set proper pin (change interrupt)
#define LED_PIN   (PIN3)


#define SYS_CLOCK ((uint32_t)8000000)
#define BAUD_RATE ((uint32_t)19200)



//next sample instant 1/19200 = 52us =~ 417 tim-ticks @ 8MHz
#define UART_BIT_TIME       ((uint16_t)(SYS_CLOCK / BAUD_RATE)) //number of clock ticks @8MHz per bit
#define UART_INC_OFFSET     ((uint16_t)(4+16)) //number of instructions till OCR0B is updated
#define UART_HALF_OCR_INC   ((uint16_t)(UART_BIT_TIME/2)) //half bit increment
#define UART_OCR_INC        ((uint16_t)UART_BIT_TIME) //single bit increment
#define UART_RX_PIN    (PIN2)
#define UART_TX_PIN    (PIN0)
#define UART_START     (1)
#define UART_STOP      (10)

//protocol definitions
#define SLOT_TAKEN_BIT (7)


//some macro's to avoid stupid mistakes...
#define IS_SET(var,b)   (var & (1 << b))
#define IS_NSET(var,b)   !(var & (1 << b))
#define SET(var,b)      (var |= (1 << b))
#define CLR(var,b)      (var &= ~(1 << b))
#define B(b)            (1 << b)
//TODO: fix somewhat ugly macro...
#define COPY_BIT(src,src_bit,dest,dest_bit) if(IS_SET(src,src_bit)){ SET(dest,dest_bit); } else {  CLR(dest,dest_bit);  }

//mask that determina what bits not to cpoy from rx msg
#define CONF_BIT_MASK (B(MSG_SLOT_TAKEN) | B(MSG_RESERVED) | B(MSG_IS_TOUCHED))
#define CONF_LED_MASK (B(LED0) | B(LED1) | B(LED2))


//multiplier to avoid floating point...
#define FILTER_MAX (1024)
//portion of multiplier that is given to new value (USE POWER OF 2!!)
#define FILTER_NEW (32)
//portion of multiplier that is given to running average
#define FILTER_AVG (FILTER_MAX-FILTER_NEW)
//low pass filter, use sparingly, costly instruction wise
#define TOUCH_FILTER_LP(avg,new) ((uint16_t)(( (((uint32_t)avg)*FILTER_AVG) + (((uint32_t)new)*FILTER_NEW) ) / FILTER_MAX))
#define TOUCH_AVG_INIT (8000)

//level above measurement noise level to detect touch
#define TOUCH_THRESHOLD (512)
//number of measurements in a row, that are above threshold needed to trigger touch
#define TOUCH_VALID_CNT (2)


uint16_t    cur_meas;
uint8_t     cur_conf,cur_touch;
uint8_t     cur_rx,cur_tx,tx_cnt;
uint8_t     state;
uint8_t     led_val;

uint8_t     touch_cnt;
uint16_t    touch_new;
uint16_t    touch_avg; //use sparsely on 8-bit machine...



int main(void) {

  init();

  //uart is only processed at end of each byte,in the interrupt handler
  //this leaves all the other time for processing measurements
  //this allows higher UART speeds

  while(TRUE){

      if( (TCNT0 >= TOUCH_TIMEOUT) && !IS_SET(state,MEAS_DONE)) {
          SET(DDRB,TOUCH_PIN);
          SET(state,MEAS_DONE);
          cli();
          touch_new = ICR0;
          sei();
          //start new measurement (clear ICF0, set pin to LOW)
          SET(TIFR0,ICF0);
          SET(TIMSK0,OCIE0B);
          SET(DDRB,TOUCH_PIN);
      } else if (TCNT0 < TOUCH_TIMEOUT){
          CLR(state,MEAS_DONE);
      }

//      //check for touch timeout / process measurement
//      if( (TCNT0 >= TOUCH_TIMEOUT)  ) {
//
//          //get input capture time, or limit if no capture occured
//          touch_new=(IS_SET(TIFR0,ICF0)) ? ICR0 : TOUCH_TIMEOUT;
//          //determine new running average
//          touch_avg = TOUCH_FILTER_LP(touch_avg,touch_new);
//          //compare new measurement to running average
//          if(touch_new > (touch_avg + TOUCH_THRESHOLD)){
//              touch_cnt++;
//              if(touch_cnt >= TOUCH_VALID_CNT){
//                  touch_cnt = TOUCH_VALID_CNT; //need for prolonged touch > 1s (avoid overflow)
//                  SET(state,TOUCHED);
//              }
//          } else {
//              touch_cnt = 0;
//          }
//
//          //start new measurement (clear ICF0, set pin to LOW)
//          SET(TIFR0,ICF0);
//          CLR(PORTB,TOUCH_PIN);
//          SET(DDRB,TOUCH_PIN);
//      }
//
//      //enable or disable led based on system state
//      if( IS_SET(state,LED_EN) || (IS_SET(state,SET_LED_DIRECT) && IS_SET(state,TOUCHED)) ){
//          //set led pin to output
//          SET(DDRB,LED_PIN);
//          CLR(PUEB,LED_PIN);
//      } else { //turn off led
//          //just setting pin to input is enough
//          CLR(DDRB,LED_PIN);
//          SET(PUEB,LED_PIN);
//      }


  }

  //should not reach
  return 0;
}


void init(void){

    cli(); //disable interrupts for the time being

    //set clock to 8Mhz, no prescaler, factory calibration
    CCP = WRITE_PROTECT_DISABLE_SIG;
    CLKPSR = 0x00;
    CLKMSR = 0x00;

    //GPIO init
    PORTB = B(LED_PIN) | B(UART_TX_PIN);
    DDRB  = B(LED_PIN) | B(TOUCH_PIN) | B(UART_TX_PIN);
    PUEB  = B(UART_RX_PIN);

    //setup external interrupt for falling edge
//    SET(EICRA,ISC01);
//    SET(EIMSK,INT0);
//    SET(EIFR,INTF0);


    //set timer normal mode (0xFFFF top is convenient for UART)
    //disconnect output compare functionality
    //enable input capture noise filter, trigger on rising edge ( 0->1)
    //leave timer disabled for now (no clock source)
    TCCR0A = 0x00;
    TCCR0B = B(ICNC0) | B(ICES0);
    //disable interrupts and clear timer for now
    TIMSK0 = 0x00;
    TCNT0  = 0x0000;

    //TODO: RSTDISBL bit ...fuse
    touch_avg = TOUCH_AVG_INIT;
    //since all interrupts are disabled, cur_rx will be read as first config
    cur_rx = DEFAULT_CONFIGURATION;
    cur_tx = 0x55;
    tx_cnt = 0x00;

    //enable ovf interrupt, start the timer and let the magic begin
    OCR0B = 0xF000;
    SET(TIMSK0,OCIE0B);
    SET(TIMSK0,TOIE0);
    SET(TCCR0B,CS00);



    sei();

}




//=====================================
//INTERRUPT HANDLERS
//=====================================

//external interrupt (start of UART RX)
ISR(INT0_vect){

    //allow touch to interrupt
    sei();

    //set first sample time
    OCR0B = TCNT0+UART_HALF_OCR_INC-UART_INC_OFFSET;
    //disable external interrupt, enable COMPA interrupt
    SET(EIFR,INTF0);
    CLR(EIMSK,INT0);
    SET(TIFR0,OCF0B);
    SET(TIMSK0,OCIE0B);

}




//OCR0A interrupt handler
ISR(TIM0_COMPB_vect){

    //allow touch to interrupt
    sei();

    //update OCR0A (always to reduce jitter)
    OCR0B += UART_OCR_INC;
    tx_cnt++;

    //update RX and TX
    if(tx_cnt == UART_START){
        //don't store sample, set TX low
        CLR(PORTB,UART_TX_PIN);
    } else if (tx_cnt < UART_STOP-1) {
        //store RX samle
        COPY_BIT(PINB,UART_RX_PIN,cur_rx,7);
        cur_rx = (cur_rx >> 1);
        //set TX output
        COPY_BIT(cur_tx,0,PORTB,UART_TX_PIN);
        cur_tx = (cur_tx >> 1);
    } else if (tx_cnt < UART_STOP) {
        //store RX samle
        COPY_BIT(PINB,UART_RX_PIN,cur_rx,7);
        //set TX output
        COPY_BIT(cur_tx,0,PORTB,UART_TX_PIN);
    } else {
        //don't sample, set TX high
        SET(PORTB,UART_TX_PIN);
        OCR0B += 10*UART_OCR_INC;
        //cur_rx done, check if message is for us
        if( 0 ) { //IS_SET(cur_rx,MSG_SLOT_TAKEN) && IS_SET(state,TAKEN_PASSED) ){

            //if for us, store settings, refresh button state
            state = (cur_rx & ~CONF_BIT_MASK) | (state & CONF_BIT_MASK);
            cur_tx = cur_rx | B(MSG_SLOT_TAKEN) | (state & B(TOUCHED));
            //update state flags
            state &= ~B(TAKEN_PASSED) & ~B(TOUCHED);
            //set led PWM output based on new config (only control upper bits, rest 1)
            OCR0AH = ~CONF_LED_MASK | state;
            OCR0AL = 0xFF;

        } else {
            //if not for us pass on untouched
            cur_tx = (uint8_t)((touch_new >> 3) & 0x00FF); //IS_SET(PINB,TOUCH_PIN);//
        }

        //we are done, set tx_counter to 0
        cur_rx = 0x00;
        tx_cnt = 0x00;
        //disable this interrupt until next RX byte
        //go to uart idle state (enable EXTI)
        CLR(TIMSK0,OCIE0B);
//        SET(EIFR,INTF0);
//        SET(EIMSK,INT0);
    }

}



#if LED_PIN != PIN3
#  error "change interrupt routines when changing LED_PIN definition"
#endif
#if TOUCH_PIN != PIN1
#  error "change interrupt routines when changing TOUCH_PIN definition"
#endif

//TIM0 overflow handler,
//Start touch measurement by setting pin to input
//also clear led pin, for PWM (pwm mode does not allow 0xFFFF as top....)
ISR(TIM0_OVF_vect, ISR_NAKED){
    //set cap_touch pin to input pin to input
    //PORTB &= ~(1 << LED_PIN);
    //DDRB &= ~(1 << TOUCH_PIN);
    asm("cbi 2,3");
    asm("cbi 1,1");
    asm("reti");
}


//kind of stupid, but needed since non-pwm mode makes PWM generation hard
//cannot set to PWM mode because the TOP values are either changing
//OC0A, OC0B and ICR, or TOP value is too low (0x03FF max).
ISR(TIM0_COMPA_vect, ISR_NAKED){
    //set cap_touch pin to input pin to input
    //PORTB |= (1 << LED_PIN);
    asm("sbi 2,3");
    asm("reti");
}

