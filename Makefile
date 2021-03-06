# ############################################################################ #
#                                                   ,---.                      #
#  Makefile                                       ,.'-.   \                    #
#                                                ( ( ,'"""""-.                 #
#  Thomas POTIER <thomas.potier@outlook.com>     `,X          `.               #
#                                                /` `           `._            #
#                                               (            ,   ,_\           #
#                                               |          ,---.,'o `.         #
#                                               |         / o   \     )        #
#                                                \ ,.    (      .____,         #
#                                                   \|     ____,'     \        #
#                                               '`'\  \        _,____,'        #
#                                               \  ,--      ,-'     \          #
#                                                 ( C     ,'         \         #
#                                                  `--'  .'           |        #
#                                                    |   |         .O |        #
#                                                   __|            ,-'_        #
#                                                 / `L     `._  _,'  ' `.      #
#                                                /    `--.._  `',.   _\  `     #
#  C: 2017/08/05 00:02 by Thomas POTIER          `-.       /\  | `. ( ,\  \    #
#  M: 2017/08/07 22:30 by Thomas POTIER         _/  `-._  /  \ |--'  (     \   #
#                                              '  `-.   `'    \/\`.   `.    )  #
#  CustomHeader ! v1.0                               \  -hrr-    \ `.  |    |  #
# ############################################################################ #

NAME = bsq

PRTS = io str reading str_nbr_ops errors linked_data
HEDS = $(PRTS) bsq
LIBS = 

SDIR = srcs
IDIR = includes
BDIR = build
LDIR = libs
DIRS = $(BDIR) $(BDIR)/$(SDIR)

SRCS = $(addprefix $(SDIR)/,$(PRTS:=.c)) $(NAME).c
OBJS = $(addprefix $(BDIR)/,$(SRCS:.c=.o))
DEPS = $(addprefix $(IDIR)/,$(HEDS:=.h))

COMP = gcc
FLGS = -Wall -Wextra -Werror $(addprefix -I,$(IDIR))

all: dirs $(NAME)

debug: FLGS += -DDEBUG -ggdb3
debug: re

dirs: $(DIRS)

$(DIRS):
	mkdir $@

$(BDIR)/%.o: %.c $(DEPS)
	$(COMP) $(FLGS) -c -o $@ $<

$(NAME): $(OBJS)
	$(COMP) $(FLGS) -o $@ $^ $(LIBS)

.PHONY: clean

clean:
	rm -f $(OBJS)

fclean: clean
	rm -fr $(BDIR)
	rm -f $(NAME)

re: fclean all
