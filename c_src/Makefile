ERTS_INCLUDE_DIR ?= $(shell erl -noshell -eval "io:format(\"~s/erts-~s/include/\", [code:root_dir(), erlang:system_info(version)])." -s erlang halt)
ERL_INTERFACE_INCLUDE_DIR ?= $(shell erl -noshell -eval "io:format(\"~s\", [code:lib_dir(erl_interface, include)])." -s erlang halt)
ERL_INTERFACE_LIB_DIR ?= $(shell erl -noshell -eval "io:format(\"~s\", [code:lib_dir(erl_interface, lib)])." -s erlang halt)

PRIV_DIR = $(MIX_APP_PATH)/priv

NIF = iconv_nif.c

ifeq ($(OS), Windows_NT)
	NIF_SO = Elixir.Iconv_nif.dll
else
	NIF_SO = Elixir.Iconv_nif.so
endif

OUTFILE = $(PRIV_DIR)/$(NIF_SO)

ifeq ($(OS), Windows_NT)
	CFLAGS   = -fPIC -I $(ERTS_INCLUDE_DIR) -I $(ERL_INTERFACE_INCLUDE_DIR) -Wall -Werror -Wmissing-prototypes
	LDFLAGS += -liconv
else
	UNAME_SYS := $(shell uname -s)

	ifeq ($(UNAME_SYS), Darwin)
		CFLAGS   = -fPIC -I $(ERTS_INCLUDE_DIR) -I $(ERL_INTERFACE_INCLUDE_DIR) -Wall -Werror -Wmissing-prototypes
		LDFLAGS += -flat_namespace -undefined dynamic_lookup -dynamiclib
	else ifeq ($(UNAME_SYS), Linux)
		CFLAGS   = -fPIC -I $(ERTS_INCLUDE_DIR) -I $(ERL_INTERFACE_INCLUDE_DIR) -Wall -Werror -Wmissing-prototypes
	endif
endif

LDLIBS   += -L "$(ERL_INTERFACE_LIB_DIR)"
LDFLAGS  += -shared

all: $(PROG)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) -o "$(OUTFILE)" $(LDFLAGS) $(LDLIBS) $(ICONV)
