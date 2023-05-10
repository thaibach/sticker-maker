#include <stdlib.h>
#include <stdint.h>
#include <math.h>

int get_red(uint64_t color) { return (color) & 0xff; }
int get_green(uint64_t color) { return (color >> 8) & 0xff; }
int get_blue(uint64_t color) { return (color >> 16) & 0xff; }
int get_alpha(uint64_t color) { return (color >> 24) & 0xff; }

int clamp255_0(int before) {
    if(before > 255) return 255;
    if(before < 0) return 0;
    return before;
}

int clamp255_n255(int before) {
    if(before > 255) return 255;
    if(before < -255) return -255;
    return before;
}

/**
 * Brightness and contrast
 * Receives a bitmap, its length, a brightness amount valuating between -255 and 255 and a contrast rate greater than 0
 */
extern "C" __attribute__((visibility("default"))) __attribute__((used))
void brightness_contrast(uint8_t *starting_pointer, int bitmap_length, int brightness_amount, double contrast_rate) {
    for (int i = 0; i < bitmap_length; i += 4) {
        uint8_t *r = starting_pointer + i;
        uint8_t *g = starting_pointer + i + 1;
        uint8_t *b = starting_pointer + i + 2;
        uint8_t *a = starting_pointer + i + 3;

        *r = clamp255_0((*r) * contrast_rate + brightness_amount);
        *g = clamp255_0((*g) * contrast_rate + brightness_amount);
        *b = clamp255_0((*b) * contrast_rate + brightness_amount);
    }
    return;
}

/**
 * Contrast
 * Receives a bitmap, its length and a contrast rate greater than 0
 */
extern "C" __attribute__((visibility("default"))) __attribute__((used))
void contrast(uint8_t *starting_pointer, int bitmap_length, double contrast_rate) {
    double contrast_sqare = contrast_rate * contrast_rate;
    uint8_t contrast_applier[256];
    for (int i = 0; i < 256; ++i) {
        contrast_applier[i] = clamp255_0(floor(((((i / 255.0) - 0.5) * contrast_sqare) + 0.5) * 255.0));
    }

    for (int i = 0; i < bitmap_length; i += 4) {
        uint8_t *r = starting_pointer + i;
        uint8_t *g = starting_pointer + i + 1;
        uint8_t *b = starting_pointer + i + 2;
        uint8_t *a = starting_pointer + i + 3;

        *r = contrast_applier[*r];
        *g = contrast_applier[*g];
        *b = contrast_applier[*b];
    }
    return;
}

/**
 * Smooth
 * Receives a bitmap, its length, width and height
 */
extern "C" __attribute__((visibility("default"))) __attribute__((used))
void smooth(uint8_t *starting_pointer, int bitmap_length, int img_width, int img_height) {
    float gaussian_kernel[9] = {1, 2, 1, 2, 4, 2, 1, 2, 1};
    for (int i = 0; i < 9; ++i) {
        gaussian_kernel[i] /= (float)16;
    }
    int padding_width = img_width + 2;
    int padding_height = img_height + 2;
    int total_padding_matrix_ele = padding_width * padding_height * 3; // no need alpha channel
    float *padding_matrix = new float[total_padding_matrix_ele];
    for (int i = 1; i < img_height+1; ++i) {
        for (int j = 1; j < img_width+1; ++j) {
            padding_matrix[(i * padding_width + j) * 3] = (float)starting_pointer[((i-1) * img_width + j-1) * 4];
            padding_matrix[(i * padding_width + j) * 3 + 1] = (float)starting_pointer[((i-1) * img_width + j-1) * 4 + 1];
            padding_matrix[(i * padding_width + j) * 3 + 2] = (float)starting_pointer[((i-1) * img_width + j-1) * 4 + 2];
        }
    }

    for (int i = 1; i < img_height+1; ++i) {
        for (int j = 1; j < img_width+1; ++j) {
            float r_value = 0;
            float g_value = 0;
            float b_value = 0;
            for (int k1 = -1; k1 < 2; ++k1) {
                for (int k2 = -1; k2 < 2; ++k2) {
                    r_value += padding_matrix[((i+k1) * padding_width + j+k2) * 3] * gaussian_kernel[(k1+1) * 3 + k2 + 1];
                    g_value += padding_matrix[((i+k1) * padding_width + j+k2) * 3 + 1] * gaussian_kernel[(k1+1) * 3 + k2 + 1];
                    b_value += padding_matrix[((i+k1) * padding_width + j+k2) * 3 + 2] * gaussian_kernel[(k1+1) * 3 + k2 + 1];
                }
            }
            *(starting_pointer + ((i-1) * img_width + j-1) * 4) = clamp255_0(int(r_value));
            *(starting_pointer + ((i-1) * img_width + j-1) * 4 + 1) = clamp255_0(int(g_value));
            *(starting_pointer + ((i-1) * img_width + j-1) * 4 + 2) = clamp255_0(int(b_value));
        }
    }
    delete[] padding_matrix;
    return;
}

/**
 * Adjust color
 * Receives a lot of stuff
 */
extern "C" __attribute__((visibility("default"))) __attribute__((used))
void adjust_color(
        uint8_t *starting_pointer,
        int bitmap_length,

        uint64_t blacks,
        uint64_t whites,
        double saturation,
        double exposure,

        int compute_blacks,
        int compute_whites
) {
    // constants
    double DEG_TO_RAD = 0.0174532925;

    double LUM_COEFF_R = 0.2125;
    double LUM_COEFF_G = 0.7154;
    double LUM_COEFF_B = 0.0721;

    // prepare exposure
    if (exposure != 0.0) {
        exposure = pow(2, exposure);
    }

    // prepare saturation
    double inv_saturation = 1 - saturation;

    /// prepare whites and blacks
    double br, bg, bb;
    double wr, wg, wb;
    if (compute_blacks || compute_whites) {
        br = compute_blacks ? get_red(blacks) / 255.0 : 0.0;
        bg = compute_blacks ? get_green(blacks) / 255.0 : 0.0;
        bb = compute_blacks ? get_blue(blacks) / 255.0 : 0.0;

        wr = compute_whites ? get_red(whites) / 255.0 : 1.0;
        wg = compute_whites ? get_green(whites) / 255.0 : 1.0;
        wb = compute_whites ? get_blue(whites) / 255.0 : 1.0;
    }

   for (int i = 0; i < bitmap_length; i += 4) {
       uint8_t *r = starting_pointer + i;
       uint8_t *g = starting_pointer + i + 1;
       uint8_t *b = starting_pointer + i + 2;


       double r_rep = *r / 255.0;
       double g_rep = *g / 255.0;
       double b_rep = *b / 255.0;

       if (compute_blacks) {
         r_rep = (r_rep + br) * wr;
         g_rep = (g_rep + bg) * wg;
         b_rep = (b_rep + bb) * wb;
       }

       // saturation
       double lum = r_rep * LUM_COEFF_R + g_rep * LUM_COEFF_G + b_rep * LUM_COEFF_B;

       r_rep = lum * inv_saturation + r_rep * saturation;
       g_rep = lum * inv_saturation + g_rep * saturation;
       b_rep = lum * inv_saturation + b_rep * saturation;

       /// exposure
       if (exposure != 0.0) {
         r_rep = r_rep * exposure;
         g_rep = g_rep * exposure;
         b_rep = b_rep * exposure;
       }

       *r = clamp255_0(floor(r_rep * 255));
       *g = clamp255_0(floor(g_rep * 255));
       *b = clamp255_0(floor(b_rep * 255));

   }
   return;
}