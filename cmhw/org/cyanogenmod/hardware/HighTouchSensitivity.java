/*
 * Copyright (C) 2016 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.cyanogenmod.hardware;

import java.io.File;
import org.cyanogenmod.hardware.util.FileUtils;
import android.os.SystemProperties;

public class HighTouchSensitivity {
	public static boolean isSupported() {
		return true;
	}

	public static boolean isEnabled() {
		return SystemProperties.getBoolean("persist.asus.glove", false);
	}

	public static boolean setEnabled(boolean state)  {
		SystemProperties.set("persist.asus.glove", ((state) ? "1" : "0"));
		return true;
	}
}