
COMMON_PATH := device/intel/common
SUPPORT_PATH := vendor/intel/support
#include $(COMMON_PATH)/BoardConfig.mk

LOCAL_PATH := device/asus/a500cg

BOARD_CREATE_MODPROBE_SYMLINK := true
TARGET_DEVICE_KERNEL_HEADERS := device/asus/a500cg/kernel-headers
TARGET_BOARD_KERNEL_HEADERS := $(COMMON_PATH)/kernel-headers
TARGET_SPECIFIC_HEADER_PATH := device/asus/a500cg/include
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := x86

# Atom optimizations to improve memory benchmarks.
-include device/asus/a500cg/OptAtom.mk

INTEL_INGREDIENTS_VERSIONS := true
LOCAL_CFLAGS += -DARCH_IA32
TARGET_PRELINK_MODULE := false

# skip some proccess to speed up build
BOARD_SKIP_ANDROID_DOC_BUILD := true
BUILD_EMULATOR := false

# enable ARM codegen for x86 with Houdini
INTEL_HOUDINI := true
BUILD_ARM_FOR_X86 := true
ADDITIONAL_BUILD_PROPERTIES += 
    ro.dalvik.vm.isa.arm=x86 \
    ro.enable.native.bridge.exec=1 \
    ro.dalvik.vm.native.bridge=libhoudini.so

TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
TARGET_USERIMAGES_USE_EXT4 := true
#planning to use f2fs for data
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1363148800
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Use dlmalloc
MALLOC_IMPL := dlmalloc

# Malloc Alignment
BOARD_MALLOC_ALIGNMENT := 16

# Appends path to ARM libs for Houdini
PRODUCT_LIBRARY_PATH := $(PRODUCT_LIBRARY_PATH):/system/lib/arm

# PRODUCT_OUT and HOST_OUT are now defined after BoardConfig is included.
# Add early definition here
PRODUCT_OUT ?= out/target/product/$(TARGET_DEVICE)
HOST_OUT ?= out/host/$(HOST_OS)-$(HOST_PREBUILT_ARCH)


# Kernel config (reference only)
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
cmdline_extra := watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789012345678901
cmdline_extra1 := ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=172M androidboot.wakesrc=05 androidboot.mode=main loglevel=8 slub_max_order=2
cmdline_extra2 := loglevel=8 kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=redhookbay androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=logk0 earlyprintk=nologger  $(cmdline_extra)  $(cmdline_extra1)  $(cmdline_extra2) 

# Disable SELinux
HAVE_SELINUX := false

#Dex preoptimization
WITH_DEXPREOPT := true

# Radio Layer Interface
RIL_SUPPORTS_SEEK := true
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_CLASS := ../../../device/asus/a500cg/ril/
SIM_COUNT := 2
ANDROID_MULTI_SIM := true
TARGET_RIL_DISABLE_STATUS_POLLING := true

# Wifi
BOARD_HAVE_WIFI := true
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcm43362/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP    := "/system/etc/firmware/fw_bcmdhd_43362_apsta.bin"
WIFI_DRIVER_FW_PATH_STA   := "/system/etc/firmware/fw_bcmdhd_43362.bin"
WIFI_DRIVER_MODULE_ARG := "iface_name=wlan0 firmware_path=/system/etc/firmware/fw_bcmdhd_43362.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BLUEDROID_ENABLE_V4L2 := true

# Graphics and compositing
BUILD_WITH_FULL_STAGEFRIGHT := true
ENABLE_IMG_GRAPHICS := true

BOARD_USES_MRST_OMX := true
BOARD_USES_WRS_OMXIL_CORE := true
TARGET_HAS_ISV := true

INTEL_VA := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBVA_INTEL_DRIVER := true

BOARD_USE_LIBMIX := true
USE_INTEL_MULT_THREAD := true

BOARD_USES_HWCOMPOSER := true
INTEL_HWC := true
TARGET_SUPPORT_HWC_SYS_LAYER := true

TARGET_HAS_MULTIPLE_DISPLAY := true
USE_MDS_LEGACY := true
USE_INTEL_MDP := true

VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.hwui.drop_shadow_cache_size = 6 \
    ro.hwui.gradient_cache_size = 1 \
    ro.hwui.layer_cache_size = 48 \
    ro.hwui.path_cache_size = 32 \
    ro.hwui.text_large_cache_width = 2048 \
    ro.hwui.text_large_cache_height = 1024 \
    ro.hwui.text_small_cache_width = 1024 \
    ro.hwui.text_small_cache_height = 1024 \
    ro.hwui.texture_cache_flushrate = 0.4 \
    ro.hwui.texture_cache_size = 72

MAX_EGL_CACHE_ENTRY_SIZE := 65536
MAX_EGL_CACHE_SIZE := 1048576


# Audio
BOARD_USES_TINY_ALSA_AUDIO := true

# Fonts
USE_MINIKIN := true
EXTENDED_FONT_FOOTPRINT := true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote32

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.config.low_ram=false \
    ro.ril.status.polling.enable=0 \
    ro.product.cpu.abi2=armeabi-v7a \
    ro.config.personality=compat_layout

# NFC
BOARD_HAVE_NFC := false

#BINDER
TARGET_USES_64_BIT_BINDER := true


# GPS
BOARD_HAVE_GPS := true
GPS_CHIP_VENDOR := bcm
GPS_CHIP := 4752
#include device/intel/common/gps/GpsBoardConfig.mk

# RMT_STORAGE
BOARD_USES_LEGACY_MMAP := true

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.sf.lcd_density=320 \
    ro.opengles.version = 131072 \
    gsm.net.interface=rmnet0 \
    persist.system.at-proxy.mode=0 \
    ro.dalvik.vm.native.bridge=libhoudini.so \
    dalvik.vm.dex2oat-Xms=64m \
    dalvik.vm.dex2oat-Xmx=512m \
    dalvik.vm.image-dex2oat-Xms=64m \
    dalvik.vm.image-dex2oat-Xmx=64m

# Generic recovery
TARGET_RECOVERY_FSTAB := device/asus/a500cg/recovery.fstab
BOARD_RECOVERY_SWIPE := true
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"

# TWRP specific options
DEVICE_RESOLUTION := 720x1280
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_L_CRYPTO := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_SCREEN_WIDTH := 720
TARGET_RECOVERY_SCREEN_HEIGHT := 1280
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "/emmc"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "/external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_EXCLUDE_SUPERSU := false
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
BOARD_SUPPRESS_EMMC_WIPE := true

BLOCK_BASED_OTA := false
BOARD_CUSTOM_MAKE_RECOVERY_PATCH := vendor/intel/hardware/libintelprov/make_recovery_patch
TARGET_RELEASETOOLS_EXTENSIONS := device/asus/a500cg/releasetools
TARGET_RELEASETOOL_MAKE_RECOVERY_PATCH_SCRIPT := device/asus/a500cg/releasetools/make_recovery_patch
#TARGET_RELEASETOOLS_EXTENSIONS := vendor/intel/hardware/libintelprov
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/asus/a500cg/releasetools/ota_from_target_files
TARGET_RECOVERY_UPDATER_LIBS += libintel_updater
TARGET_OTA_ASSERT_DEVICE := a500cg,a501cg,cm_a500cg,cm_a501cg,ASUS_T00F,ASUS_T00J,a600cg,cm_a600cg,ASUS_T00G

TARGET_RECOVERY_UPDATER_EXTRA_LIBS += \
#    libcgpt_static \
    liboempartitioning_static \
PRODUCT_LIBRARY_PATH := $(PRODUCT_LIBRARY_PATH):/system/lib/egl:/system/vendor/lib/egl
#RECOVERY_VARIANT := twrp
#TARGET_PROVIDES_INIT_RC := true
USE_OSIP := true
REF_DEVICE_NAME := redhookbay

# Init
TARGET_IGNORE_RO_BOOT_SERIALNO := true
# Hardware
BOARD_HARDWARE_CLASS := device/asus/a500cg/cmhw
#BOARD_PROVIDES_INIT := true
ENABLE_SENSOR_HUB := true
#ENABLE_SCALABLE_SENSOR_HAL := false
ENABLE_SCALABLE_SENSOR_HAL := true
BOARD_FUNCTIONFS_HAS_SS_COUNT := true
# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# select libcamera2 as the camera HAL
USE_CAMERA_HAL2 := true
USE_CSS_1_5 := true
USE_CSS_2_0 := true
USE_CSS_2_1 := true
USE_INTEL_METABUFFER := true
USE_INTEL_JPEG := true
USE_CAMERA_IO_BREAKDOWN := true


# disable the new V3 HAL by default so it can be added to the tree without conflicts
# it will be enabled in selected platforms
USE_CAMERA_HAL_3 := false

# Set USE_VIDEO_EFFECT to 'false' to unsupport live face effect. And Set OMX Component Input Buffer Count to 2.
USE_VIDEO_EFFECT := true

# Do not use shared object of ia_face by default
USE_SHARED_IA_FACE := false

# Use panorama v1.0 by default
IA_PANORAMA_VERSION := 1.0

# Turn on GR_STATIC_RECT_VB flag in skia to boost performance
TARGET_USE_GR_STATIC_RECT_VB := true

BOARD_USES_CYANOGEN_HARDWARE := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

#WebRTC
ENABLE_WEBRTC := true

BOARD_HAVE_MODEM := true

# Logcat use android kernel logger
TARGET_USES_LOGD := false
TARGET_HAVE_CWS := true

#Enable exfat
VOLD_ENABLE_EXFAT := true

#ASF
USE_INTEL_ASF_EXTRACTOR := true

INTEL_FEATURE_DPTF := true
 
 # PowerHAL
 TARGET_POWERHAL_VARIANT := redhookbay
