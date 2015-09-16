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
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 ******************************************************************************
 * Define all Warmux actions.
 *****************************************************************************/

//-----------------------------------------------------------------------------
#include <stdlib.h>
#include <string.h>

#include <WARMUX_action.h>
#include <WARMUX_distant_cpu.h>
#include <WARMUX_error.h>
#include <WARMUX_euler_vector.h>

#include <SDL_net.h>

//-----------------------------------------------------------------------------

#define MAX_NUM_VARS 16384

Action::Action(Action_t type)
{
  Init(type);
}

Action::Action(Action_t type, int32_t m_value)
{
  Init(type);
  Push(m_value);
}

Action::Action(Action_t type, Double m_value)
{
  Init(type);
  Push(m_value);
}

Action::Action(Action_t type, const std::string& m_value)
{
  Init(type);
  Push(m_value);
}

Action::Action(Action_t type, Double m_value1, Double m_value2)
{
  Init(type);
  Push(m_value1);
  Push(m_value2);
}

Action::Action(Action_t type, Double m_value1, int32_t m_value2)
{
  Init(type);
  Push(m_value1);
  Push(m_value2);
}

Action::~Action()
{
  if (m_var)
    free(m_var);
  m_write = m_read = m_var = NULL;
  m_header.len = 0;
  m_bufsize = 0;
}

// Build an action from a network packet
Action::Action(const char *buffer, DistantComputer* _creator)
{
  m_creator = _creator;

  m_header.len = SDLNet_Read32((Uint8*)buffer);
  ASSERT(m_header.len >= sizeof(Header));
  buffer += 4;
  // All of the following could be skipped for the actions we now,
  // for instance ACTION_GAME_CALCULATE_FRAME_PACKED
  m_header.type = buffer[0];
  buffer++;

  m_header.len -= sizeof(Header);
  m_bufsize = m_header.len;
  if (m_header.len) {
    m_read = m_write = m_var = (uint8_t*)malloc(m_bufsize);
    memcpy(m_var, buffer, m_bufsize);
  } else {
    m_read = m_write = m_var = NULL;
  }
}

void Action::Init(Action_t type)
{
  m_header.type = (uint8_t)type;
  m_header.len = 0;
  m_bufsize = 0;
  m_write = m_read = m_var = NULL;
  m_creator = NULL;
}

void Action::Resize(uint n)
{
  if (n < m_bufsize)
    return;
  if (m_write) {
    uint offset = m_write - m_var;
    m_var = (uint8_t*)realloc(m_var, n);
    m_write = m_var + offset;
  } else {
    m_write = m_var = (uint8_t*)malloc(n);
  }
  m_read = m_var;
  m_bufsize = n;
}

void Action::Write(char *buffer) const
{
  uint32_t len = GetSize();
  SDLNet_Write32(len, buffer);
  buffer += 4;
  buffer[0] = m_header.type;
  buffer++;

  if (m_header.len) {
    memcpy(buffer, m_var, m_header.len);
  }
}

// Convert the action to a packet
void Action::WriteToPacket(char* &packet, int & size) const
{
  size = GetSize();
  packet = (char*)malloc(size);

  Write(packet);
}

//-------------  Add datas to the action  ----------------
void Action::Push(int32_t m_val)
{
  if (MemWriteLeft() < 4)
    Increase();
  SDLNet_Write32(m_val, m_write); m_write += 4; m_header.len += 4;
}

void Action::Push(Double m_val)
{
#if FIXINT_BITS == 32
  uint32_t tmp = *((uint32_t*)&m_val.intValue);
  if (MemWriteLeft() < 4)
    Increase();
  SDLNet_Write32(m_val, m_write); m_write += 4;
#else
  uint32_t tmp[2];

  if (MemWriteLeft() < 8)
    Increase();
  memcpy(tmp, &m_val.intValue, 8);
#  if (SDL_BYTEORDER == SDL_LIL_ENDIAN)
  SDLNet_Write32(tmp[0], m_write); m_write+= 4;
  SDLNet_Write32(tmp[1], m_write); m_write+= 4;
#  else
  SDLNet_Write32(tmp[1], m_write); m_write+= 4;
  SDLNet_Write32(tmp[0], m_write); m_write+= 4;
#  endif
#endif
  m_header.len += sizeof(fp::fint_t);
}

void Action::Push(const Point2i& m_val)
{
  Push(m_val.x);
  Push(m_val.y);
}

void Action::Push(const Point2d& m_val)
{
  Push(m_val.x);
  Push(m_val.y);
}

void Action::Push(const EulerVector &m_val)
{
  Push(m_val.x0);
  Push(m_val.x1);
  Push(m_val.x2);
}

void Action::Push(const std::string& m_val)
{
  // First, write the size of the string (assume len<65536):
  uint16_t size = m_val.size();
  if (MemWriteLeft() < uint(size+2))
    Increase(size+2);
  SDLNet_Write16(size, m_write); m_write += 2;

  // Then write the actual string
  if (size) {
    memcpy(m_write, m_val.c_str(), size);
    m_write += size;
  }
  m_header.len += size+2;
}

//-------------  Retrieve datas from the action  ----------------
int Action::PopInt()
{
  NET_ASSERT(MemReadLeft() >= 4)
  {
    if (m_creator) m_creator->ForceDisconnection();
    return 0;
  }

  uint32_t tmp = SDLNet_Read32(m_read); m_read += 4;

  return *((int32_t*)&tmp);
}

Double Action::PopDouble()
{
  NET_ASSERT(MemReadLeft() >= sizeof(fp::fint_t))
  {
    if (m_creator) m_creator->ForceDisconnection();
    return 0.0;
  }

  union
  {
	uint32_t u32[sizeof(fp::fint_t)/4];
	fp::fint_t f;
  } tmp;
  
  static const uint len = sizeof(fp::fint_t)/4;
  for (uint i=0; i<len; i++) {
#  if SDL_BYTEORDER == SDL_LIL_ENDIAN
    tmp.u32[i] = SDLNet_Read32(m_read);
#  else
    tmp.u32[len-1-i] = SDLNet_Read32(m_read);
#  endif
    m_read += 4;
  }

  Double val;
  val.intValue = tmp.f;
  return val;
}

std::string Action::PopString()
{
  NET_ASSERT(MemReadLeft() >= 2)
  {
    if (m_creator) m_creator->ForceDisconnection();
    return "";
  }

  uint16_t length = SDLNet_Read16(m_read); m_read += 2;
  NET_ASSERT(MemReadLeft() >= length)
  {
    if (m_creator) m_creator->ForceDisconnection();
    return "";
  }

  std::string str((char*)m_read, length);
  m_read += length;
  return str;
}

Point2i Action::PopPoint2i()
{
  int x, y;
  x = PopInt();
  y = PopInt();
  return Point2i(x, y);
}

Point2d Action::PopPoint2d()
{
  Double x, y;
  x = PopDouble();
  y = PopDouble();
  return Point2d(x, y);
}

EulerVector Action::PopEulerVector()
{
  Double x0, x1, x2;
  x0 = PopDouble();
  x1 = PopDouble();
  x2 = PopDouble();
  return EulerVector(x0, x1, x2);
}
