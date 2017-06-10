LOCAL_PATH:= $(call my-dir)

common_src_files := 	src/agent.c \
						src/crypt.c \
						src/keepalive.c \
						src/libgcrypt.c	\
						src/misc.c \
						src/packet.c \
						src/scp.c \
						src/transport.c \
						src/wincng.c \
						src/channel.c \
						src/global.c \
						src/kex.c \
						src/mac.c \
						src/openssl.c \
						src/pem.c \
						src/session.c \
						src/userauth.c \
						src/comp.c \
						src/hostkey.c \
						src/knownhost.c \
						src/mbedtls.c \
						src/os400qc3.c\
						src/publickey.c \
						src/sftp.c \
						src/version.c

common_share_libraries += libssl libcrypto libz
common_c_flags :=
common_c_includes := $(LOCAL_PATH)/include \
					$(LOCAL_PATH)/../openssl/include \
					$(LOCAL_PATH)/../zlib

#######################################
# target static library
include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES := $(common_share_libraries)
LOCAL_SRC_FILES += $(common_src_files)
LOCAL_CFLAGS += $(common_c_flags)
LOCAL_C_INCLUDES += $(common_c_includes)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libssh2_static
include $(BUILD_STATIC_LIBRARY)

#######################################
# target shared library
include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES := $(common_share_libraries)
LOCAL_SRC_FILES += $(common_src_files)
LOCAL_CFLAGS += $(common_c_flags)
LOCAL_CFLAGS += -O3
LOCAL_C_INCLUDES += $(common_c_includes)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libssh2
include $(BUILD_SHARED_LIBRARY)

