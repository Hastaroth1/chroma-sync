﻿using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChromaSync
{
    class RegistryKeeper
    {
        public static void CreateSettings()
        {
            RegistryKey ProgSettings = Registry.CurrentUser.OpenSubKey("Software", true);
            ProgSettings.CreateSubKey("ChromaSync");
            ProgSettings.Close();
        }

        public static string GetValue(string s)
        {
            CreateSettings();
            RegistryKey ProgSettings = Registry.CurrentUser.OpenSubKey("Software\\ChromaSync", true);
            var setting = ProgSettings.GetValue(s, false).ToString(); // retrieve settings    
            ProgSettings.Close();
            return setting;
        }


        public static void UpdateReg(string s, string t)
        {
            CreateSettings();
            RegistryKey ProgSettings = Registry.CurrentUser.OpenSubKey("Software\\ChromaSync", true);
            ProgSettings.SetValue(s, t); // retrieve settings    
            ProgSettings.Close();
        }

    }
}
