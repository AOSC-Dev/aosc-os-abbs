#include <stdio.h>
#include <WARMUX_types.h>
#include <WARMUX_network.h>
#include <WARMUX_index_server.h>
#include <WARMUX_random.h>
#include <unistd.h>

bool numeric_name = false;

void list_games(std::string version, bool show_dns)
{
  connection_state_t conn = IndexServer::GetInstance()->Connect(version);
  if (conn != CONNECTED) {
    if (conn == CONN_WRONG_VERSION) {
      fprintf(stderr,"Sorry, version %s is not supported. Supported versions: %s\n",
	      version.c_str(), IndexServer::GetInstance()->GetSupportedVersions().c_str());
    } else {
      fprintf(stderr, "ERROR: Fail to connect to the index server\n");
    }
    return;
  }

  std::list<GameServerInfo> lst = IndexServer::GetInstance()->GetHostList(show_dns);

  IndexServer::GetInstance()->Disconnect();

  if (lst.empty()) {
    fprintf(stderr, "Sorry, currently, no game servers for version %s\n", version.c_str());
    return;
  }

  for (std::list<GameServerInfo>::iterator it = lst.begin(); it != lst.end(); ++it) {
    printf("%s (%d) %s:%s - %s - %s\n",
	   version.c_str(), it->passworded, it->ip_address.c_str(), it->port.c_str(),
	   it->dns_address.c_str(), it->game_name.c_str());
  }
}

void parseArgs(int argc, char *argv[])
{
  int opt;

  while ((opt = getopt(argc, argv, "n")) != -1) {
    switch (opt) {
    case 'n':
      numeric_name = true;
      break;
    default:
      break;
    }
  }
}

int main(int argc, char *argv[])
{
  parseArgs(argc, argv);

  if (optind - argc >= 0) {
    fprintf(stderr,
	    "usage: warmux-list-games [OPTIONS] <version> [<version> ...]\n"
	    "OPTIONS\n"
	    "\t-n\t show numerical addresses instead of trying to determine symbolic host names\n");
    exit(EXIT_FAILURE);
  }

  RandomLocal().InitRandom();

  for (int i = optind; i < argc; i++)
    list_games(argv[i], !numeric_name);
}
