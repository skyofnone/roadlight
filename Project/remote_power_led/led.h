#ifndef __LED_H
#define __LED_H

#define LED_GPIOA_PORT  (GPIOA)
#define LED_GPIOA_PINS  (GPIO_PIN_3)
#define LED_GPIOC_PORT  (GPIOC)
#define LED_GPIOC_PINS  (GPIO_PIN_6 | GPIO_PIN_2 | GPIO_PIN_1 | GPIO_PIN_5 | GPIO_PIN_7)
#define LED_GPIOD_PORT  (GPIOD)
#define LED_GPIOD_PINS  (GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_7 | GPIO_PIN_0)
#define LED_GPIOF_PORT  (GPIOF)
#define LED_GPIOF_PINS  (GPIO_PIN_4)

void led_gpio_init(void);
void dig_ctl_1(uint8_t on);
void dig_ctl_2(uint8_t on);
void dig_ctl_3(uint8_t on);
void show_0(void);
void show_1(void);
void show_2(void);
void show_3(void);
void show_4(void);
void show_5(void);
void show_6(void);
void show_7(void);
void show_8(void);
void show_9(void);
void show_dot(uint8_t on);
void show_black(void);
void show_led(uint8_t num);


#endif /*__LED_H*/

