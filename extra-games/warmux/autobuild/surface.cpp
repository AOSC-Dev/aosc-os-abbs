/******************************************************************************
 *  Warmux is a convivial mass murder game.
 *  Copyright (C) 2001-2011 Warmux Team.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A ARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU GeneralPublic License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 ******************************************************************************
 * Handle a SDL Surface
 *****************************************************************************/

#include <iostream>
#include <SDL.h>
#include <SDL_gfxPrimitives.h>
#include <SDL_image.h>
#include <SDL_rotozoom.h>
#include <png.h>
#include <zlib.h>

#include "graphic/surface.h"
#include "tool/math_tools.h"

/* texturedPolygon import from SDL_gfx v2.0.15 */
#if (SDL_GFXPRIMITIVES_MAJOR == 2) && (SDL_GFXPRIMITIVES_MINOR == 0) && (SDL_GFXPRIMITIVES_MICRO < 14)
#include "graphic/textured_polygon.h"
#endif /* texturedPolygon import from SDL_gfx v2.0.15 */

#include "graphic/fading_effect.h"

/**
 * Constructor building a surface by reading the image from a file.
 *
 * @param filename_str A string containing the path to the graphic file.
 */
Surface::Surface(const std::string &filename)
{
  surface = NULL;
  autoFree = true;
  if (!ImgLoad(filename))
    Error(Format("Unable to open image file '%s': %s", filename.c_str(), IMG_GetError()));
}

/**
 * Copy constructor: build a surface from an other surface.
 *
 * The two surfaces share the same graphic data.
 */
Surface::Surface(const Surface &src)
{
  surface = src.surface;
  autoFree = true;
  if (!IsNull())
    surface->refcount++;
}

Surface &Surface::operator=(const Surface & src)
{
  AutoFree();
  surface = src.surface;
  autoFree = true;
  if (!IsNull())
    surface->refcount++;

  return *this;
}

/**
 * Free the memory occupied by the surface.
 *
 * The memory is really freed if the reference counter reach 0.
 */
void Surface::Free()
{
  if (!IsNull()) {
    SDL_FreeSurface(surface);
    surface = NULL;
  }
}

/**
 * Create a new surface.
 *
 * @param size
 * @param flags
 * @param useAlpha
 */
void Surface::NewSurface(const Point2i &size, Uint32 flags, bool useAlpha)
{
  if (autoFree)
    Free();

  const SDL_PixelFormat* fmt = SDL_GetVideoSurface()->format;
  // If no alpha, use default parameters
  if (!useAlpha) {
    surface = SDL_CreateRGBSurface(flags, size.x, size.y,
                                   fmt->BitsPerPixel, fmt->Rmask, fmt->Gmask, fmt->Bmask, 0);
  } else {
    // Code below taken from SDL_DisplayFormatAlpha
    // Why the default parameters to SDL_CreateRGBSurface when using 32bits are
    // not equivalent to this !?
    Uint32 amask = 0xff000000;
    Uint32 rmask = 0x00ff0000;
    Uint32 gmask = 0x0000ff00;
    Uint32 bmask = 0x000000ff;

    switch(fmt->BytesPerPixel) {
    case 2:
      /* For XGY5[56]5, use, AXGY8888, where {X, Y} = {R, B}.
         For anything else (like ARGB4444) it doesn't matter
         since we have no special code for it anyway */
      if (fmt->Rmask == 0x1f && (fmt->Bmask==0xf800 || fmt->Bmask==0x7c00)) {
        rmask = 0xff;
        bmask = 0xff0000;
      }
      break;

    case 3:
    case 4:
      /* Keep the video format, as long as the high 8 bits are
         unused or alpha */
      if (fmt->Rmask == 0xff && fmt->Bmask == 0xff0000) {
        rmask = 0xff;
        bmask = 0xff0000;
      }
      break;

    default:
      /* We have no other optimised formats right now. When/if a new
         optimised alpha format is written, add the converter here */
      break;
    }
    surface = SDL_CreateRGBSurface(flags|SDL_SRCALPHA, size.x, size.y, 32,
                                   rmask, gmask, bmask, amask);
  }
  if (!surface)
    Error(std::string("Can't create SDL RGB(A) surface: ") + SDL_GetError());
}

/**
 * Set the alpha value of a surface.
 *
 */
int Surface::SetAlpha(Uint32 flags, Uint8 alpha)
{
  return SDL_SetAlpha(surface, flags, alpha);
}

/**
 * Lock the surface to permit direct access.
 *
 */
void Surface::Lock()
{
  if (SDL_MUSTLOCK(surface)) {
    if (SDL_LockSurface(surface) < 0) {
      fprintf(stderr, "Failed to lock surface: %s\n", SDL_GetError());
      exit(-1);
    }
  }
}

/**
 * Unlock the surface.
 *
 */
void Surface::Unlock()
{
  SDL_UnlockSurface(surface);
}

void Surface::SwapClipRect(Rectanglei& rect)
{
  SDL_Rect newClipRect = GetSDLRect(rect);
  SDL_Rect oldClipRect;

  SDL_GetClipRect(surface, &oldClipRect);
  SDL_SetClipRect(surface, &newClipRect);

  rect.SetPositionX(oldClipRect.x);
  rect.SetPositionY(oldClipRect.y);
  rect.SetSizeX(oldClipRect.w);
  rect.SetSizeY(oldClipRect.h);
}


int Surface::Blit(const Surface& src, SDL_Rect *srcRect, SDL_Rect *dstRect)
{
  int ret = SDL_BlitSurface(src.surface, srcRect, surface, dstRect);
  if (ret < 0) {
    printf("Blit failed (code=%i): %s\n", ret, SDL_GetError());
  }
  return ret;
}

/**
 * Blit a surface (src) on the current surface at a certain position (dst)
 *
 * @src The source surface.
 * @dst A point defining the destination coordinate on the current surface.
 */
int Surface::Blit(const Surface& src, const Point2i &dst)
{
  SDL_Rect dstRect = GetSDLRect(dst);

  return Blit(src, NULL, &dstRect);
}

/**
 * Blit a part (srcRect) of surface (src) at a certaint position (dst) of the current surface/
 *
 * @param src
 * @param srcRect
 * @param dstPoint
 */
int Surface::Blit(const Surface& src, const Rectanglei &srcRect, const Point2i &dstPoint)
{
  SDL_Rect sdlSrcRect = GetSDLRect(srcRect);
  SDL_Rect sdlDstRect = GetSDLRect(dstPoint);

  return Blit(src, &sdlSrcRect, &sdlDstRect);
}

/**
 * Merge a sprite (spr) with current Surface at a given position.
 *
 * No more buggy but slow ! :) Don't use it for quick blit. Needed by the ground generator.
 *
 * @param spr
 * @param position
 */
void Surface::MergeSurface(Surface &spr, const Point2i &pos)
{
  spr.Lock();
  Lock();

  SDL_PixelFormat* cur_fmt = surface->format;
  SDL_PixelFormat * spr_fmt = spr.surface->format;

  // for each pixel lines of a source image
  if (cur_fmt->BytesPerPixel == spr_fmt->BytesPerPixel && cur_fmt->BytesPerPixel == 4) {
    int     cur_pitch = (surface->pitch>>2);
    Uint32* cur_ptr   = (Uint32*)surface->pixels;
    int     spr_pitch = (spr.surface->pitch>>2);
    Uint32* spr_ptr   = (Uint32*)spr.surface->pixels;
    Uint32  spr_pix, cur_pix, a, p_a;
    Point2i offset;

    offset.y = (pos.y > 0) ? 0 : -pos.y;

    cur_ptr += pos.x + (pos.y + offset.y) * cur_pitch;
    spr_ptr += offset.y * spr_pitch;

    // Same masks: use more optimized version
    if (cur_fmt->Amask == spr_fmt->Amask) {
      Uint32  ashift    = cur_fmt->Ashift;
      Uint32  amask     = cur_fmt->Amask;
      // shift necessary to move the RGB triplet into the LSBs
      Uint32  shift     = (ashift) ? 0 : 8;

      for (; offset.y < spr.GetHeight() && pos.y + offset.y < GetHeight(); offset.y++) {
        for (offset.x = (pos.x > 0 ? 0 : -pos.x); offset.x < spr.GetWidth() && pos.x + offset.x < GetWidth(); offset.x++) {
          // Retrieving a pixel of sprite to merge
          spr_pix = spr_ptr[offset.x];
          cur_pix = cur_ptr[offset.x];

          a   = (spr_pix&amask)>>ashift;
          p_a = (cur_pix&amask)>>ashift;

          if (a == SDL_ALPHA_OPAQUE || (!p_a && a)) // new pixel with no alpha or nothing on previous pixel
            cur_ptr[offset.x] = spr_pix;
          else if (a) { // alpha is lower => merge color with previous value
            uint f_a  = a + 1;
            uint f_ca = 256 - f_a;

            // A will be discarded either by this shift or the bitmasks used
            cur_pix >>= shift;
            spr_pix >>= shift;
            // Only do 2 components at a time, and avoid one component overflowing
            // to bleed into other components
            Uint32 tmp = ((cur_pix&0xFF00FF)*f_ca + (spr_pix&0xFF00FF)*f_a)>>8;
            tmp &= 0xFF00FF;

            tmp |= (((cur_pix&0xFF00)*f_ca + (spr_pix&0xFF00)*f_a)>>8) & 0xFF00;

            a = (a > p_a) ? a : p_a;
            cur_ptr[offset.x] = (tmp<<shift) | (a<<ashift);
          }
        }

        spr_ptr += spr_pitch;
        cur_ptr += cur_pitch;
      }
    } else {
      // Troublesome masks: use generic version
      for (; offset.y < spr.GetHeight() && pos.y + offset.y < GetHeight(); offset.y++) {
        for (offset.x = (pos.x > 0 ? 0 : -pos.x); offset.x < spr.GetWidth() && pos.x + offset.x < GetWidth(); offset.x++) {
          // Retrieving a pixel of sprite to merge
          spr_pix = spr_ptr[offset.x];
          cur_pix = cur_ptr[offset.x];

          a   = (spr_pix&spr_fmt->Amask)>>spr_fmt->Ashift;
          p_a = (cur_pix&cur_fmt->Amask)>>cur_fmt->Ashift;

          if (a == SDL_ALPHA_OPAQUE || (!p_a && a)) {
            // new pixel with no alpha or nothing on previous pixel
            cur_ptr[offset.x] = spr_pix;
          } else if (a) {
            // alpha is lower => merge color with previous value
            uint f_a  = a + 1;
            uint f_ca = 256 - f_a;

            Uint32 r = (((cur_pix&cur_fmt->Rmask)>>cur_fmt->Rshift)*f_ca +
                        ((spr_pix&spr_fmt->Rmask)>>spr_fmt->Rshift)*f_a)>>8;
            Uint32 g = (((cur_pix&cur_fmt->Gmask)>>cur_fmt->Gshift)*f_ca +
                        ((spr_pix&spr_fmt->Gmask)>>spr_fmt->Gshift)*f_a)>>8;
            Uint32 b = (((cur_pix&cur_fmt->Bmask)>>cur_fmt->Bshift)*f_ca +
                        ((spr_pix&spr_fmt->Bmask)>>spr_fmt->Bshift)*f_a)>>8;

            a = (a > p_a) ? a : p_a;
            cur_ptr[offset.x] = (r<<cur_fmt->Rshift)|(g<<cur_fmt->Gshift)|
                                (b<<cur_fmt->Bshift)|(a<<cur_fmt->Ashift);
          }
        }

        spr_ptr += spr_pitch;
        cur_ptr += cur_pitch;
      }
    }
  } else {
    fprintf(stderr, "Not handling: spr=(bpp=%u,rmask=%X) vs surf=(bpp=%u,rmask=%X)\n",
            spr_fmt->BytesPerPixel, spr_fmt->Rmask, cur_fmt->BytesPerPixel, cur_fmt->Rmask);
    Blit(spr, pos);
  }

  Unlock();
  spr.Unlock();
}

int Surface::SetColorKey(Uint32 flag, Uint32 key)
{
  return SDL_SetColorKey(surface, flag, key);
}

void Surface::GetRGBA(Uint32 color, Uint8 &r, Uint8 &g, Uint8 &b, Uint8 &a) const
{
  SDL_GetRGBA(color, surface->format, &r, &g, &b, &a);
}

Uint32 Surface::MapRGBA(Uint8 r, Uint8 g, Uint8 b, Uint8 a) const
{
  return SDL_MapRGBA(surface->format, r, g, b, a);
}

Color Surface::GetColor(Uint32 color) const
{
  Uint8 r, g, b, a;
  GetRGBA(color, r, g, b, a);
  return Color(r, g, b, a);
}

Uint32 Surface::MapColor(const Color& color) const
{
  return MapRGBA(color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

void Surface::Flip()
{
  SDL_Flip(surface);
}

  int Surface::BoxColor(const Rectanglei &rect, const Color &color)
{
  if (rect.IsSizeZero())
    return 0;

  Point2i ptBR = rect.GetBottomRightPoint();

  return boxRGBA(surface, rect.GetPositionX(), rect.GetPositionY(), ptBR.GetX(), ptBR.GetY(), color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::RectangleColor(const Rectanglei &rect, const Color &color,
                            const uint &border_size)
{
  if (rect.IsSizeZero())
    return 0;

  Point2i ptBR = rect.GetBottomRightPoint();

  if (border_size == 1)
    return rectangleRGBA(surface, rect.GetPositionX(), rect.GetPositionY(), ptBR.GetX(), ptBR.GetY(), color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());

  // top border
  boxRGBA (surface,
           rect.GetPositionX(), rect.GetPositionY(), ptBR.GetX(), rect.GetPositionY()+border_size,
           color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());

  // bottom border
  boxRGBA (surface,
           rect.GetPositionX(), ptBR.GetY() - border_size, ptBR.GetX(), ptBR.GetY(),
           color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());

  // left border
  boxRGBA (surface,
           rect.GetPositionX(), rect.GetPositionY() + border_size, rect.GetPositionX()+border_size, ptBR.GetY()-border_size,
           color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());

  // right border
  boxRGBA (surface,
           ptBR.GetX() - border_size, rect.GetPositionY() + border_size, ptBR.GetX(), ptBR.GetY()-border_size,
           color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());

  return 1;
}

int Surface::VlineColor(const uint &x, const uint &y1, const uint &y2, const Color &color)
{
  return vlineRGBA(surface, x, y1, y2, color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::HlineColor(const uint &x1, const uint &x2, const uint &y, const Color &color)
{
  return hlineRGBA(surface, x1, x2, y, color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::LineColor(const uint &x1, const uint &x2, const uint &y1, const uint &y2, const Color &color)
{
  return lineRGBA(surface, x1, y1, x2, y2, color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::AALineColor(const uint &x1, const uint &x2, const uint &y1, const uint &y2, const Color &color)
{
  return aalineRGBA(surface, x1, y1, x2, y2, color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::AAFadingLineColor(const uint &x1, const uint &x2, const uint &y1, const uint &y2, const Color &color1, const Color &color2)
{
  return aafadingLineColor(surface, x1, y1, x2, y2,color1.GetColor(), color2.GetColor());
}

int Surface::CircleColor(const uint &x, const uint &y, const uint &rad, const Color &color)
{
  return circleRGBA(surface, x, y, rad, color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::FilledCircleColor(const uint &x, const uint &y, const uint &rad, const Color &color)
{
  return filledCircleRGBA(surface, x, y, rad, color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::PieColor(const uint &x, const uint &y, const uint &rad, const int &start, const int &end, const Color &color)
{
  return pieRGBA(surface, x, y, rad, start, end, color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::FilledPieColor(const uint &x, const uint &y, const uint &rad, const int &start, const int &end, const Color &color)
{
  return filledPieRGBA(surface, x, y, rad, start, end, color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::AAPolygonColor(const Sint16 * vx, const Sint16 * vy, const int n, const Color & color) {
  return aapolygonRGBA(surface, vx, vy, n, color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::AAPolygonColor(std::list<Point2i> polygon, const Color & color)
{
  Sint16 * vx, * vy;
  vx = new Sint16[polygon.size()];
  vy = new Sint16[polygon.size()];
  int i = 0;
  for (std::list<Point2i>::iterator point = polygon.begin(); point != polygon.end(); point++, i++) {
    vx[i] = point->x;
    vy[i] = point->y;
  }
  int result = aapolygonRGBA(surface, vx, vy, polygon.size(), color.GetRed(),
                             color.GetGreen(), color.GetBlue(), color.GetAlpha());
  delete[] vx;
  delete[] vy;
  return result;
}

int Surface::FilledPolygon(const Sint16 * vx, const Sint16 * vy, const int n, const Color & color)
{
  // Internal static leak in sdl_gfx
  return filledPolygonRGBA(surface, vx, vy, n, color.GetRed(), color.GetGreen(), color.GetBlue(), color.GetAlpha());
}

int Surface::FilledPolygon(std::list<Point2i> polygon, const Color & color)
{
  Sint16 * vx, * vy;
  vx = new Sint16[polygon.size()];
  vy = new Sint16[polygon.size()];
  int i = 0;
  for (std::list<Point2i>::iterator point = polygon.begin(); point != polygon.end(); point++, i++) {
    vx[i] = point->x;
    vy[i] = point->y;
  }
  int result = filledPolygonRGBA(surface, vx, vy, polygon.size(), color.GetRed(),
                                 color.GetGreen(), color.GetBlue(), color.GetAlpha());
  delete[] vx;
  delete[] vy;
  return result;
}

int Surface::TexturedPolygon(const Sint16 * vx, const Sint16 * vy, const int n, const Surface *texture, const int texture_dx, const int texture_dy)
{
  return texturedPolygon(surface, vx, vy, n, texture->surface, texture_dx, texture_dy);
}

int Surface::TexturedPolygon(std::list<Point2i> polygon, const Surface * texture)
{
  Sint16 * vx, * vy;
  vx = new Sint16[polygon.size()];
  vy = new Sint16[polygon.size()];
  int i = 0;
  for (std::list<Point2i>::iterator point = polygon.begin(); point != polygon.end(); point++, i++) {
    vx[i] = point->x;
    vy[i] = point->y;
  }
  int result = texturedPolygon(surface, vx, vy, polygon.size(), texture->surface, 0, 0);
  delete[] vx;
  delete[] vy;
  return result;
}

/**
 *
 * @param color
 */
int Surface::Fill(Uint32 color) const
{
  return SDL_FillRect(surface, NULL, color);
}

int Surface::Fill(const Color &color) const
{
  return Fill(MapColor(color));
}

/**
 *
 * @param dstRect
 * @param color
 */
int Surface::FillRect(const Rectanglei &dstRect, Uint32 color) const
{
  SDL_Rect sdlDstRect = GetSDLRect(dstRect);

  return SDL_FillRect(surface, &sdlDstRect, color);
}

/**
 *
 * @param dstRect
 * @param color
 */
int Surface::FillRect(const Rectanglei &dstRect, const Color &color) const
{
  return FillRect(dstRect, MapColor(color));
}

/**
 *
 * @param filename
 */
int Surface::ImgLoad(const std::string& filename)
{
  AutoFree();
  surface = IMG_Load(filename.c_str());

  return !IsNull();
}

/**
 *
 * @param filename
 */
bool Surface::ImgSave(const std::string& filename, bool bmp)
{
  if (bmp) {
    return (surface) ? SDL_SaveBMP(surface, filename.c_str())==0 : false;
  }

  FILE            *f        = NULL;
  png_structp      png_ptr  = NULL;
  png_infop        info_ptr = NULL;
  SDL_PixelFormat *spr_fmt  = surface->format;
  bool             ret      = false;
  Uint8           *tmp_line = NULL;

  // Creating a png ...
  png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
  if (png_ptr == NULL) // Structure and ...
    return 1;
  info_ptr = png_create_info_struct(png_ptr);
  if (info_ptr == NULL) // Information.
    goto end;

  // Opening a new file
  f = fopen(filename.c_str(), "wb");
  if (f == NULL)
    goto end;

  png_init_io(png_ptr, f); // Associate png struture with a file
  png_set_IHDR(png_ptr, info_ptr, surface->w, surface->h, 8,
               PNG_COLOR_TYPE_RGB_ALPHA,      PNG_INTERLACE_NONE,
               PNG_COMPRESSION_TYPE_DEFAULT,  PNG_FILTER_TYPE_DEFAULT);
  png_set_compression_level(png_ptr, Z_BEST_COMPRESSION);

  // Creating the png file
  png_write_info(png_ptr, info_ptr);

  tmp_line = new Uint8[surface->w * spr_fmt->BytesPerPixel];
  Lock();
  for (int y = 0; y < surface->h; y++) {
    for (int x = 0; x < surface->w; x++) {
      Uint8   r, g, b, a;
      // Retrieving a pixel of sprite to merge
      Uint32  spr_pix = ((Uint32*)surface->pixels)[y * surface->w  + x];

      // Retreiving each chanel of the pixel using pixel format
      SDL_GetRGBA(spr_pix, surface->format, &r, &g, &b, &a);
      tmp_line[x * spr_fmt->BytesPerPixel + 0] = r;
      tmp_line[x * spr_fmt->BytesPerPixel + 1] = g;
      tmp_line[x * spr_fmt->BytesPerPixel + 2] = b;
      tmp_line[x * spr_fmt->BytesPerPixel + 3] = a;
    }
    png_write_row(png_ptr, (Uint8 *)tmp_line);
  }
  Unlock();
  delete[] tmp_line;
  png_write_flush(png_ptr);
  png_write_end(png_ptr, info_ptr);
  ret = true;

end:
  if (info_ptr) png_destroy_info_struct(png_ptr, &info_ptr);
  if (png_ptr) png_destroy_write_struct(&png_ptr, NULL);
  if (f) fclose(f);
  return ret;
}

#if SDL_GFXPRIMITIVES_MICRO > 20
template<typename pixel>
static void
mirror(void *d, uint dpitch,
       const void* s, uint spitch,
       int w, int h)
{
  pixel *dst = (pixel*)d;
  const pixel *src = ((pixel*)s)+(w-1);

  dpitch /= sizeof(pixel);
  spitch /= sizeof(pixel);

  while (h--) {
    for (int x=0; x<w; x++)
      dst[x] = src[-x];
    dst += dpitch;
    src += spitch;
  }
}
#endif

Surface Surface::Mirror()
{
#if SDL_GFXPRIMITIVES_MICRO > 20
  const SDL_PixelFormat *fmt = surface->format;
  SDL_Surface *surf = SDL_CreateRGBSurface(surface->flags, surface->w, surface->h, fmt->BitsPerPixel,
                                           fmt->Rmask, fmt->Gmask, fmt->Bmask, fmt->Amask);

  if (SDL_MUSTLOCK(surface))
    SDL_LockSurface(surface);
  if (SDL_MUSTLOCK(surf))
    SDL_LockSurface(surf);

  switch (fmt->BitsPerPixel)
  {
  case 8:
    mirror<Uint8>(surf->pixels, surf->pitch, surface->pixels, surface->pitch,
                  surf->w, surf->h);
    break;
  case 16:
    mirror<Uint16>(surf->pixels, surf->pitch, surface->pixels, surface->pitch,
                   surf->w, surf->h);
    break;
  case 32:
    mirror<Uint32>(surf->pixels, surf->pitch, surface->pixels, surface->pitch,
                   surf->w, surf->h);
    break;
  case 24:
    {
      uint8_t *dst = (uint8_t*)surf->pixels;
      const uint8_t *src = (uint8_t*)surface->pixels;
      src += 3*(surf->w-1);
      for (int y=0; y<surf->h; y++) {
        for (int x=0; x<3*surf->w; x+=3) {
          dst[x+0] = src[0-x];
          dst[x+1] = src[1-x];
          dst[x+2] = src[2-x];
        }
        dst += surf->pitch;
        src += surface->pitch;
      }
      break;
    }
  default: fprintf(stderr, "Unsupported bpp %i\n", fmt->BitsPerPixel); exit(1);
  }

  SDL_UnlockSurface(surf);
  SDL_UnlockSurface(surface);

  if (surface->flags & SDL_SRCALPHA)
    SDL_SetAlpha(surf, SDL_SRCALPHA, surface->format->alpha);
  if (surface->flags & SDL_SRCCOLORKEY)
    SDL_SetColorKey(surf, SDL_SRCCOLORKEY|SDL_RLEACCEL, surface->format->colorkey);

  return Surface(surf);
#else
  return Surface(zoomSurface(surface, -1, 1, 1)).DisplayFormatAlpha();
#endif
}

/**
 *
 * @param angle in radian
 * @param zoomx
 * @param zoomy
 * @param smooth
* Warning rotozoomSurfaceXY uses degrees so the rotation of image use degrees here,
* but when accessing thanks to GetSurfaceForAngle the index is using radian
* (because we juste need an index in array, not an angle) */
static const Double ratio_deg_to_rad = 180 / PI;
Surface Surface::RotoZoom(Double angle, Double zoomx, Double zoomy)
{
  SDL_Surface *surf;

  if (EqualsZero(angle)) {
    if (zoomx!=ONE || zoomy!=ONE)
      surf = zoomSurface(surface, zoomx.toDouble(), zoomy.toDouble(), 1);
    else {
      return *this;
    }
  } else if (zoomx == zoomy && zoomx > ZERO) {
    surf = rotozoomSurface(surface, (angle * ratio_deg_to_rad).toDouble() , zoomx.toDouble(), 1);
  } else {
    surf = rotozoomSurfaceXY(surface, (angle * ratio_deg_to_rad).toDouble() , zoomx.toDouble(), zoomy.toDouble(), 1);
  }

  if (!surf)
    Error("Unable to make a rotozoom on the surface !");

  return surface->format->Amask ? Surface(surf).DisplayFormatAlpha() : Surface(surf).DisplayFormat();
}

Surface Surface::DisplayFormatAlpha()
{
  if (surface->format->BitsPerPixel == 24)
    return DisplayFormat();

  const SDL_PixelFormat *fo = SDL_GetVideoSurface()->format,
                        *fi = surface->format;
  if (fi->Rmask==fo->Rmask && fi->Bmask==fo->Bmask && fi->Amask==fo->Amask)
    return *this;
  SDL_Surface *surf = SDL_DisplayFormatAlpha(surface);

  if (!surf)
    Error("Unable to convert the surface to a surface compatible with the display format with alpha.");

  return Surface(surf);
}

Surface Surface::DisplayFormat()
{
  const SDL_PixelFormat *fo = SDL_GetVideoSurface()->format,
                        *fi = surface->format;
  if (fi->Rmask==fo->Rmask && fi->Bmask==fo->Bmask && fi->Amask==0)
    return *this;

  SDL_Surface *surf = SDL_DisplayFormat(surface);

  if (!surf)
    Error("Unable to convert the surface to a surface compatible with the display format.");

  return Surface(surf);
}


/**
 * GetPixel.
 *
 * From the SDL wiki.
 * @param x
 * @param y
 */
Uint32 Surface::GetPixel(int x, int y) const
{
  int bpp = surface->format->BytesPerPixel;
  /* Here p is the address to the pixel we want to retrieve */
  Uint8 *p = (Uint8 *)surface->pixels + y * surface->pitch + x * bpp;

  switch(bpp) {
  case 1:
    return *p;

  case 2:
    return *(Uint16 *)p;

  case 3:
#if SDL_BYTEORDER == SDL_BIG_ENDIAN
    return p[0] << 16 | p[1] << 8 | p[2];
#else
    return p[0] | p[1] << 8 | p[2] << 16;
#endif
  case 4:
    return *(Uint32 *)p;

  default:
    Error("Unknow bpp!");
    return 0;   // To make gcc happy
  }
}

/**
 *
 * @param x
 * @param y
 * @param pixel
 */
void Surface::PutPixel(int x, int y, Uint32 pixel) const
{
  int bpp = surface->format->BytesPerPixel;
  /* Here p is the address to the pixel we want to set */
  Uint8 *p = (Uint8 *)surface->pixels + y * surface->pitch + x * bpp;

  switch(bpp) {
  case 1:
    *p = pixel;
    break;

  case 2:
    *(Uint16 *)p = pixel;
    break;

  case 3:
#if SDL_BYTEORDER == SDL_BIG_ENDIAN
    p[0] = (pixel >> 16) & 0xff;
    p[1] = (pixel >> 8) & 0xff;
    p[2] = pixel & 0xff;
#else
    p[0] = pixel & 0xff;
    p[1] = (pixel >> 8) & 0xff;
    p[2] = (pixel >> 16) & 0xff;
#endif
    break;

  case 4:
    *(Uint32 *)p = pixel;
    break;
  }
}

SDL_Rect Surface::GetSDLRect(const Rectanglei &r)
{
  SDL_Rect sdlRect;

  sdlRect.x = r.GetPositionX();
  sdlRect.y = r.GetPositionY();
  sdlRect.w = r.GetSizeX();
  sdlRect.h = r.GetSizeY();

  return sdlRect;
}

SDL_Rect Surface::GetSDLRect(const Point2i &pt)
{
  SDL_Rect sdlRect;

  sdlRect.x = pt.GetX();
  sdlRect.y = pt.GetY();
  sdlRect.w = 0;
  sdlRect.h = 0;

  return sdlRect;
}

Surface Surface::DisplayFormatColorKey(const uint32_t* data, SDL_PixelFormat *sfmt,
                                       int w, int h, int stride,
                                       uint8_t threshold, bool rle)
{
  SDL_PixelFormat *fmt   = SDL_GetVideoSurface()->format;
  uint             bpp   = fmt->BitsPerPixel==16 ? 16 : 24;
  Surface          surf(SDL_CreateRGBSurface(SDL_SWSURFACE, w, h, bpp, 0, 0, 0, 0));
  const uint32_t  *src   = data;
  int              pitch = stride>>2;
  Uint32           ckey  = SDL_MapRGB(surf.surface->format, 0xFF, 0, 0xFF);

  surf.Lock();

  // Set pixels considered as transparent as colorkey
  for (int y=0; y<h; y++) {
    for (int x=0; x<w; x++) {
      uint8_t r, g, b, a;
      SDL_GetRGBA(*(src + x), sfmt, &r, &g, &b, &a);
      surf.PutPixel(x, y, (a < threshold) ? ckey : SDL_MapRGB(surf.surface->format, r, g, b));
    }

    src += pitch;
  }

  surf.Unlock();
  if (rle)
    surf.SetColorKey(SDL_SRCCOLORKEY|SDL_RLEACCEL, ckey);
  else
    surf.SetColorKey(SDL_SRCCOLORKEY, ckey);

  return surf;
}

Surface Surface::DisplayFormatColorKey(uint8_t alpha_threshold, bool rle)
{
  Lock();
  Surface tmp = DisplayFormatColorKey((uint32_t*)surface->pixels, surface->format,
                                      surface->w, surface->h, surface->pitch,
                                      alpha_threshold, rle);
  Unlock();
  return tmp;
}

Surface Surface::Crop(const Rectanglei& area) const
{
  Surface sub(area.GetSize(), SDL_SWSURFACE, surface->format->Amask!=0);
  SDL_SetAlpha(surface, 0, 0);
  sub.Blit(*this, -area.GetPosition());
  return sub;
}
