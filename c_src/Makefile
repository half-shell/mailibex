PROG = sysstatd
ERTS_INCLUDE_DIR ?= $(shell erl -noshell -eval "io:format(\"~s/erts-~s/include/\", [code:root_dir(), erlang:system_info(version)])." -s erlang halt)
ERL_INTERFACE_INCLUDE_DIR ?= $(shell erl -noshell -eval "io:format(\"~s\", [code:lib_dir(erl_interface, include)])." -s erlang halt)
ERL_INTERFACE_LIB_DIR ?= $(shell erl -noshell -eval "io:format(\"~s\", [code:lib_dir(erl_interface, lib)])." -s erlang halt)
ICONV = "./iconv_nif.c"


UNAME_SYS := $(shell uname -s)

ifeq ($(UNAME_SYS), Darwin)
	CFLAGS   = -fPIC -I $(ERTS_INCLUDE_DIR) -I $(ERL_INTERFACE_INCLUDE_DIR) -Wall -Werror -Wmissing-prototypes
	LDFLAGS += -flat_namespace -undefined suppress
else ifeq ($(UNAME_SYS), Linux)
	CFLAGS   = -fPIC -I $(ERTS_INCLUDE_DIR) -I $(ERL_INTERFACE_INCLUDE_DIR) -Wall -Werror -Wmissing-prototypes
endif

LDLIBS   += -L "$(ERL_INTERFACE_LIB_DIR)"
LDFLAGS  += -shared

all: $(PROG)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) -o "../priv/Elixir.Iconv_nif.so" $(LDFLAGS) $(LDLIBS) $(ICONV)
