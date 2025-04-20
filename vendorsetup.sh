#
# Copyright (C) 2025 The Android Open Source Project
#
#
    fi
    if grep -q "bool twrpRepacker::Flash_Current_Twrp()" "$file"; then
        echo "Function twrpRepacker::Flash_Current_Twrp() found in file"
        if ! grep -q "if (TWFunc::Path_Exists(\"/system/bin/reflash_recovery.sh\"))" "$file"; then
            echo "Insert the code into the twrpRepacker::Flash_Current_Twrp() function"
            sed -i '/bool twrpRepacker::Flash_Current_Twrp() {/a \
    if (TWFunc::Path_Exists("/system/bin/reflash_recovery.sh")) {\
        gui_print("- Starting custom reflash recovery script\\n");\
        int pipe_fd[2];\
        if (pipe(pipe_fd) == -1) {\
            LOGERR("Failed to create pipe");\
            return false;\
        }\
        if (TWFunc::Path_Exists("/system/bin/reflash_recovery.sh")) {\
            std::string command = "/system/bin/reflash_recovery.sh " + std::to_string(pipe_fd[1]) + " " + std::to_string(pipe_fd[0]);\
            gui_print("- Reflashing recovery\\n");\
            int result = TWFunc::Exec_Cmd(command);\
            if (result != 0) {\
                LOGERR("Script reflash_recovery.sh failed with error code: %d", result);\
                gui_print_color("error", "Script reflash_recovery.sh failed with error code: %d\\n", result);\
                return false;\
            }\
            gui_print_color("green", "- Successfully flashed recovery to both slots\\n");\
            close(pipe_fd[0]);\
            close(pipe_fd[1]);\
            return true;\
        }\
        return false;\
    }' "$file"
            echo "The code has been inserted successfully."
        else
            echo "The code is already present in the twrpRepacker::Flash_Current_Twrp() function."
        fi
    else
        echo "Function twrpRepacker::Flash_Current_Twrp() not found in file."
        exit 1
    fi
}

inject_self_repacker 

export TARGET_ARCH="arm64-v8a"

# Build environment stuffs
export TWRP_BUILD_DEVICE="Pixel6"
export ALLOW_MISSING_DEPENDENCIES=true
export TARGET_DEVICE_ALT="Pixel6, GooglePixel6, oriole, oriole"
export TWRP_TARGET_DEVICES="Pixel6, GooglePixel6, oriole, oriole"
export BUILD_USERNAME="nobody"
export BUILD_HOSTNAME="android-build"

# Use magisk boot for patching
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1

# We have a/b partitions
export TWRP_AB_DEVICE=1
export TWRP_VIRTUAL_AB_DEVICE=1

# Boot
export RECOVERY_AS_BOOT=1

# Screen specifications
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_CLOCK_POS=0
export OF_SCREEN_H=2400
export OF_STATUS_H=120

# Device stuff
export OF_KEEP_FORCED_ENCRYPTION=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_FBE_METADATA_MOUNT_IGNORE=1
export OF_USE_LEGACY_BATTERY_SERVICES=1

# Disable decryption
export OF_SKIP_FBE_DECRYPTION=1

# Run a process after formatting data to work-around MTP issues
export OF_RUN_POST_FORMAT_PROCESS=1

