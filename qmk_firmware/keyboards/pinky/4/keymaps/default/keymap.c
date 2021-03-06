#include QMK_KEYBOARD_H


#define _LAYER0 0
#define _LAYER1 1
#define _LAYER2 2
#define _LAYER3 3
#define _LAYER4 4

enum custom_keycodes {
    LAYER0 = SAFE_RANGE,
    LAYER1,
    LAYER2,
    LAYER3,
    LAYER4,
};

 const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

 [_LAYER0] = LAYOUT(KC_F12, KC_1, KC_2, KC_3, KC_4, KC_5, KC_GRV, KC_6, KC_7, KC_8, KC_9, KC_0, KC_MINS, KC_EQL, KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_LBRC, KC_RBRC, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_BSLS, KC_LCTL, KC_A, KC_S, KC_D, KC_F, KC_G, TT(3), TT(1), KC_H, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT, KC_ESC, KC_Z, KC_X, KC_C, KC_V, KC_B, KC_LSFT, KC_SPC, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_ESC, LT(4,KC_APP), KC_LGUI, KC_BSPC, LALT_T(KC_ENT), RALT_T(KC_ENT), LT(2,KC_DEL), KC_LGUI, OSM(MOD_MEH)),

[_LAYER1] = LAYOUT(LSFT(KC_0), LSFT(KC_2), KC_LBRC, KC_RBRC, LCTL(KC_Y), KC_F, KC_I, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_L, KC_O, KC_UP, KC_R, KC_T, KC_H, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_P, KC_LEFT, KC_DOWN, KC_RGHT, KC_G, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, LCTL(KC_Z), KC_X, KC_C, KC_V, KC_B, RSFT_T(KC_K), KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_SFTENT, KC_TRNS, KC_SPC, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS),

[_LAYER2] = LAYOUT(KC_F12, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_PSCR, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_MYCM, KC_TRNS, KC_1, KC_2, KC_3, KC_4, KC_5, KC_TILD, KC_6, KC_7, KC_8, KC_9, KC_0, KC_CIRC, KC_PIPE, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_VOLD, KC_VOLU, TG(1), TG(3), KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, KC_END, KC_HOME, LALT(KC_F4), KC_EXLM, KC_AT, KC_HASH, KC_DLR, KC_PERC, KC_CAPS, KC_MPLY, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_LCBR, KC_RCBR, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_MNXT, KC_MPRV),

[_LAYER3] = LAYOUT(KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NLCK, KC_CALC, KC_P7, KC_P8, KC_P9, KC_PAST, KC_PSLS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_BSPC, KC_P4, KC_P5, KC_P6, KC_PPLS, KC_PMNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_DEL, KC_P1, KC_P2, KC_P3, KC_PENT, KC_HASH, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_P0, KC_COMM, KC_PDOT, KC_PENT, KC_PEQL, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS),

[_LAYER4] = LAYOUT(KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, TG(1), TG(3), KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS) 

};
