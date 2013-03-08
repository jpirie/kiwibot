/*********************************************************************
 * Copyright 2012 2013 William Gatens
 * Copyright 2012 2013 John Pirie
 *
 * Kiwibot is a free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Kiwibot is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Kiwibot.  If not, see <http://www.gnu.org/licenses/>.
 ********************************************************************/

#ifndef IRCBOT_H_
#define IRCBOT_H_

#include <string.h>
#include <map>

// headers for lua
extern "C" {
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
}

class IrcBot {
public:
  IrcBot(std::string, std::string);
  virtual ~IrcBot();

  bool setup;
  int outputToChannel(std::string);
  int outputToSource(std::string, std::string, bool);

  void init(std::string, std:: string);

  int mainLoop();

 private:
  std::map<std::string, std::string> luaFileHashes;

  std::string message;
  char *port;

  lua_State *luaState;

  std::string nick;
  std::string user;

  // values to help tell if joe is in his office
  bool reportJoeStatus;
  int joeStatus;

  std::string checkServerMessages (char*, size_t);
  void saveData();
  void loadData();

  char * timeNow();

  void sendPong(std::string buf);

  int parseMessage(std::string buf);
  void parsePrivateMessage(std::string buf);
  int checkAndParseMessages ();

};

#endif /* IRCBOT_H_ */
