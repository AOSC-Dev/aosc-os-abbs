/* Written by: Xiao-Long Chen <chenxiaolong@cxl.epac.to> */

/* This program will monitor /usr/share/applications/ for changes and rebuild
 * /usr/share/applications/bamf.index accordingly. It will wait for pacman to
 * finish first before updating */

/* Compile with (gcc|clang) bamfwatcher.c -lprocps -o bamfwatcher */

#include <errno.h>
#include <limits.h>
#include <proc/readproc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/inotify.h>

/* Allow the buffer to hold 100 events */
#define BUF_LEN (100 * (sizeof(struct inotify_event) + NAME_MAX + 1))

static void print_event(struct inotify_event *event) {
  if (event->mask & IN_ACCESS)
    printf("%s: File was accessed\n",                           event->name);
  if (event->mask & IN_ATTRIB)
    printf("%s: Metadata was changed\n",                        event->name);
  if (event->mask & IN_CLOSE_WRITE)
    printf("%s: File opened for writing was closed\n",          event->name);
  if (event->mask & IN_CLOSE_NOWRITE)
    printf("%s: File not opened for writing was closed\n",      event->name);
  if (event->mask & IN_CREATE)
    printf("%s: File/directory was created\n",                  event->name);
  if (event->mask & IN_DELETE)
    printf("%s: File/directory was deleted\n",                  event->name);
  if (event->mask & IN_DELETE_SELF)
    printf("%s: Watched file/directory was deleted\n",          event->name);
  if (event->mask & IN_MODIFY)
    printf("%s: File was modified\n",                           event->name);
  if (event->mask & IN_MOVE_SELF)
    printf("%s: Watched file/directory was moved\n",            event->name);
  if (event->mask & IN_MOVED_FROM)
    printf("%s: File was moved out of the watched directory\n", event->name);
  if (event->mask & IN_MOVED_TO)
    printf("%s: File was moved into the watched directory\n",   event->name);
  if (event->mask & IN_OPEN)
    printf("%s: File was opened\n",                             event->name);
}

void wait_for_pacman() {
  /* This is really ugly code, but I can't think of a better way to do this
   * other than a busy wait. From what I can find, kqueue is the best way to
   * solve the problem, but it doesn't exist on Linux. */

  proc_t **processes = readproctab(PROC_FILLSTAT | PROC_FILLCOM);

  int i;
  for (i = 0; processes[i] != NULL; i++) {
    if (processes[i]->cmdline != NULL) {
      int length = strlen(processes[i]->cmdline[0]);
      if (length >= 6 &&
          strcmp(processes[i]->cmdline[0] + length - 6, "pacman") == 0) {
        printf("pacman is running. (PID %i) Waiting for it to finish...",
               processes[i]->tid);
        fflush(stdout);
        while (1) {
          if (kill(processes[i]->tid, 0) == -1 && errno == ESRCH) {
            break;
          }
          /* Check every second */
          sleep(1);
        }
        printf(" Done\n");
      }
    }
  }
}

void rebuild() {
  wait_for_pacman();
  printf("Rebuilding bamf.index...");
  fflush(stdout);
  system("/usr/lib/bamf/update-bamf-index.pl /usr/share/applications/ > /usr/share/applications/bamf.index");
  printf(" Done\n");
}

int main(int argc, char *argv[]) {
  if (getuid() != 0) {
    fprintf(stderr, "Must be run as root!\n");
    exit(1);
  }

  int fd = inotify_init();
  if (fd < 0) {
    fprintf(stderr, "inotify_init() failed!\n");
    exit(1);
  }

  if (access("/usr/share/applications/bamf.index", F_OK) != 0) {
    rebuild();
  }

  /* Watch /usr/share/applications/ */
  int wd = inotify_add_watch(fd, "/usr/share/applications", IN_ATTRIB |
                                                            IN_CREATE |
                                                            IN_DELETE |
                                                            IN_MOVED_TO |
                                                            IN_MOVED_FROM |
                                                            IN_MODIFY);

  if (wd < 0) {
    fprintf(stderr, "inotify_add_watch() failed!\n");
    exit(1);
  }

  char buf[BUF_LEN];

  while (1) {
    int length = read(fd, buf, BUF_LEN);
    if (length <= 0) {
      fprintf(stderr, "read() from inotify file descriptor returned %i!\n", length);
      exit(1);
    }
    //printf("Read %ld bytes from inotify file descriptor\n", (long)length);

    int needs_updating = 0;

    int i = 0;
    while (i < length) {
      struct inotify_event *event = (struct inotify_event *)&buf[i];
      /* Make sure we don't get into an infinite loop */
      if (strcmp(event->name, "bamf.index") != 0) {
        print_event(event);
        needs_updating = 1;
      }
      i += sizeof(struct inotify_event) + event->len;
    }

    /* No need to update bamf cache for every event */
    if (needs_updating == 1) {
      rebuild();
    }
  }
}

